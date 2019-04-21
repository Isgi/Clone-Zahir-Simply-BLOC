import 'package:meta/meta.dart';
import 'package:zahir_online_clone/models/contacts_model.dart';
import 'package:built_collection/built_collection.dart';

abstract class ContactsDataSource {
  Future<BuiltList<ContactsModel>> getContacts({
    @required int limit,
    @required String field,
    ContactsModel startAfter,
  });
}
