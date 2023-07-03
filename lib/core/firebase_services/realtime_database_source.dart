import 'package:firebase_database/firebase_database.dart' as rt_database;
import 'package:properties/core/firebase_services/data_model.dart';
import 'package:properties/core/firebase_services/realtime_util.dart';
import 'package:properties/core/firebase_services/source.dart';

class CustomRealTimeDatabaseSource<T extends DataModel> extends Source<T> {
  CustomRealTimeDatabaseSource({
    required this.referenceName,
    required this.fromJson,
    required this.toJson,
  }) {
    ref = rt_database.FirebaseDatabase.instance.ref().child(referenceName);
  }

  final String referenceName;
  final T Function(Map<String, dynamic> data) fromJson;
  final Map<String, dynamic> Function(T obj) toJson;
  late final rt_database.DatabaseReference ref;

  //use for adjusting the path.
  Future<void> modifyPath(String path) async {
    ref = ref.child(path);
  }

  @override
  Future<void> deleteItem(T obj) async => await ref.child(obj.id!).remove();

  @override
  SourceType get type => SourceType.remote;

  //convert from document to dart model
  T fromDocument(rt_database.DataSnapshot document) => fromJson({
        ...(document.value as Map).cast<String, dynamic>(), //descontructuring.
        ...{'id': document.key}
      });

  @override
  Future<List<T>> getItems() async {
    return (await ref.get())
        .children
        .map<T>((snapshot) => fromDocument(snapshot))
        .toList();
  }

  // create and updates
  @override
  Future<T?> setItem(T obj, {String? id}) async {
    late rt_database.DatabaseReference docRef;

    if (obj.id != null) {
      //if the object already exists, do the Firebase equivalent of
      //PUT/PATCH
      await ref.child(obj.id!).update(toJson(obj));
      docRef = ref.child(obj.id!);
    } else {
      //perform posting of data to realtime database
      //if the object is new, do the Firebase equivalent of POST
      final newItemRef = ref.push(); //ref to new item;
      await newItemRef.set(
        {
          ...toJson(obj),
          'id': newItemRef.key,
        },
      );
      docRef = ref.child(newItemRef.key!);
    }
    //return a reloaded document in case it had any
    //fields that were resolved on the server
    return fromDocument(await docRef.get());
  }

  //this function get single item.
  @override
  Future<T?> viewItem(String id) async {
    rt_database.DataSnapshot snapshot = await ref.child(id).get();
    if (snapshot.value != null) {
      return fromDocument(snapshot);
    } else {
      return null;
    }
  }

  //order, filter, limit
  Future<List<T>> getPaginatedItems(
      List<FilterSortClause>? filters) async {
    rt_database.Query refQuery = ref;
    if (filters != null && filters.isNotEmpty) {
      for (final whereClause in filters) {
        if (whereClause.type == FilterType.orderByKey) {
          refQuery = ref.orderByKey();
        }
        if (whereClause.type == FilterType.orderByChild) {
          refQuery = ref.orderByChild(whereClause.fieldName);
        }
        if (whereClause.type == FilterType.orderByValue) {
          refQuery = ref.orderByValue();
        }

        if (whereClause.type == FilterType.limitToFirst) {
          refQuery = ref.limitToFirst(30);
        }

        if (whereClause.type == FilterType.limitToLast) {
          refQuery = ref.limitToLast(30);
        }

        if (whereClause.type == FilterType.equals) {
          refQuery = ref.equalTo(whereClause.value, key: whereClause.fieldName);
        }

        if (whereClause.type == FilterType.startAfter) {
          refQuery = ref.startAt(whereClause.value, key: whereClause.fieldName);
        }

        if (whereClause.type == FilterType.endAfter) {
          refQuery = ref.endAt(whereClause.value, key: whereClause.fieldName);
        }
      }
    }

    rt_database.DataSnapshot databaseSnapshot = await refQuery.get();
    return databaseSnapshot.children
        .map<T>((rt_database.DataSnapshot snapshot) => fromDocument(snapshot))
        .toList();
  }

  //order, filter, limit
  Stream<List<T>> subscribeTo(List<FilterSortClause>? filters) async* {
    rt_database.Query refQuery = ref;
    if (filters != null && filters.isNotEmpty) {
      for (final whereClause in filters) {
        if (whereClause.type == FilterType.orderByKey) {
          refQuery = ref.orderByKey();
        }
        if (whereClause.type == FilterType.orderByChild) {
          refQuery = ref.orderByChild(whereClause.fieldName);
        }
        if (whereClause.type == FilterType.orderByValue) {
          refQuery = ref.orderByValue();
        }

        if (whereClause.type == FilterType.limitToFirst) {
          refQuery = ref.limitToFirst(30);
        }

        if (whereClause.type == FilterType.limitToLast) {
          refQuery = ref.limitToLast(30);
        }

        if (whereClause.type == FilterType.equals) {
          refQuery = ref.equalTo(whereClause.value, key: whereClause.fieldName);
        }

        if (whereClause.type == FilterType.startAfter) {
          refQuery = ref.startAt(whereClause.value, key: whereClause.fieldName);
        }

        if (whereClause.type == FilterType.endAfter) {
          refQuery = ref.endAt(whereClause.value, key: whereClause.fieldName);
        }
      }
    }

    Stream<rt_database.DatabaseEvent> databaseEvents = refQuery.onValue;
    yield* databaseEvents.map<List<T>>(
      (rt_database.DatabaseEvent event) =>
          event.snapshot.children.map<T>(fromDocument).toList(),
    );
  }
}
