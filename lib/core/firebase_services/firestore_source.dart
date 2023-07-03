import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:properties/core/firebase_services/data_model.dart';
import 'package:properties/core/firebase_services/firestore_util.dart';
import 'package:properties/core/firebase_services/source.dart';

class CustomFirebaseSource<T extends DataModel> extends Source<T> {
  CustomFirebaseSource({
    required this.collectionName,
    required this.fromJson,
    required this.toJson,
  }) {
    collection =
        firestore.FirebaseFirestore.instance.collection(collectionName);
  }

  final String collectionName;
  final T Function(Map<String, dynamic> data) fromJson;
  final Map<String, dynamic> Function(T obj) toJson;
  late final firestore.CollectionReference collection;

  @override
  Future<void> deleteItem(T obj) async => await collection.doc(obj.id).delete();

  @override
  SourceType get type => SourceType.remote;

  //convert from document to dart model
  T fromDocument(firestore.DocumentSnapshot document) => fromJson({
        ...(document.data() as Map).cast<String, dynamic>(), //descontructuring.
        ...{'id': document.id}
      });

  @override
  Future<List<T>> getItems() async =>
      (await collection.get()).docs.map<T>((doc) => fromDocument(doc)).toList();

  // create and updates
  @override
  Future<T?> setItem(T obj) async {
    late firestore.DocumentReference docRef;

    if (obj.id != null) {
      //if the object already exists, do the Firebase equivalent of
      //PUT/PATCH
      await collection.doc(obj.id).update(toJson(obj));
      docRef = collection.doc(obj.id);
    } else {
      //if the object is new, do the Firebase equivalent of POST
      final itemId = collection.doc().id; //generate an id;
      await collection.doc(itemId).set(toJson(obj));
      docRef = collection.doc(itemId);
    }
    //Return a reloaded document in case it had any
    //fields that were resolved on the server
    return fromDocument(await docRef.get());
  }

  //this function get single item.
  @override
  Future<T?> viewItem(String id) async {
    firestore.DocumentSnapshot userDoc = await collection.doc(id).get();
    if (userDoc.data() != null) {
      return fromDocument(userDoc);
    } else {
      return null;
    }
  }

  Stream<List<T>> subscribeTo(List<WhereClause>? where) async* {
    //collection.where() returns a 'Query'
    firestore.Query query = collection;
    if (where != null && where.isNotEmpty) {
      for (final whereClause in where) {
        if (whereClause.type == FilterType.equals) {
          query =
              query.where(whereClause.fieldName, isEqualTo: whereClause.value);
        } else if (whereClause.type == FilterType.greaterThan) {
          query = query.where(whereClause.fieldName,
              isGreaterThan: whereClause.value);
        } else if (whereClause.type == FilterType.whereIn) {
          if ((whereClause.value as List<Object>).isNotEmpty) {
            query = query.where(
              whereClause.fieldName,
              whereIn: whereClause.value as List<Object>,
            );
          }
        } else {
          throw Exception('Failed to handle FilterType of ${whereClause.type}');
        }
      }
    }

    Stream<firestore.QuerySnapshot> snapshots = query.snapshots();
    yield* snapshots.map<List<T>>(
      (firestore.QuerySnapshot snapshot) =>
          snapshot.docs.map<T>(fromDocument).toList(),
    );
  }
}
