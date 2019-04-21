import 'dart:async';
import 'package:built_collection/src/list.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:zahir_online_clone/models/contacts_model.dart';
import 'package:zahir_online_clone/resources/contacts_data_source.dart';

class ContactsProvider implements ContactsDataSource {
  Client client = Client();
  final token = 'Bearer 6KkxZddLuW3cPSgX9fDdUsf03trofdnNj8aNCM3I';

  @override
  Future<BuiltList<ContactsModel>> getContacts({
    int limit,
    String field,
    ContactsModel startAfter
  }) async {
    print('gitaaaaaaaaaa');
    // TODO: implement getContacts
    final response = await client.get(
    "https://apites2.zahironline.com/api/v2/contacts?isort[name]=1",
    headers: {
      "Content-type": "application/json",
      "Authorization": token
    });
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      Iterable i = json.decode(response.body);
      final contacts = i.map((snapshot) {
        return ContactsModel.fromJson(snapshot); 
      }).toList();
      return BuiltList.of(contacts);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

//  Future<ContactsModel> fetchContacts() async {
//    final response = await client.get(
//      "https://apites2.zahironline.com/api/v2/contacts?isort[name]=1",
//      headers: {
//        "Content-type": "application/json",
//        "Authorization": token
//      });
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      // If the call to the server was successful, parse the JSON
//      return ContactsModel.fromJson(json.decode(response.body));
//    } else {
//      // If that call was not successful, throw an error.
//      throw Exception('Failed to load post');
//    }
//  }
//
//  Future<ContactsModel> loadMoreContacts(String next_url) async {
//    final response = await client.get(
//      next_url,
//      headers: {
//        "Content-type": "application/json",
//        "Authorization": token
//      });
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      // If the call to the server was successful, parse the JSON
//      return ContactsModel.fromJson(json.decode(response.body));
//    } else {
//      // If that call was not successful, throw an error.
//      throw Exception('Failed to load post');
//    }
//  }

}