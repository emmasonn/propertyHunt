import 'package:properties/core/firebase_services/data_model.dart';
import 'package:properties/core/firebase_services/firestore_util.dart';

enum SourceType { remote, local }
enum RequestType { local, remote }

abstract class Source<T extends DataModel> {

  SourceType get type;

  Future<T?> viewItem(String id);

  Future<List<T>> getItems();

  Future<T?> setItem(T obj);

  Future<void> deleteItem(T obj);
  
}

