import 'dart:async';
import 'contacts_provider.dart';
import 'package:zahir_online_clone/models/contacts_model.dart';

class Repository {
  final contactsApiProvider = ContactsProvider();

//  Future<ContactsModel> fetchContacts() => contactsApiProvider.fetchContacts();
//
//  Future<ContactsModel> loadMoreContacts(String next_url) => contactsApiProvider.loadMoreContacts(next_url);
}