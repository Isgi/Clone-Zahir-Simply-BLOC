import 'dart:convert';

import 'package:zahir_online_clone/models/contacts_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' show Client;

class ContactsDataSource {
  Client client = Client();
  final token = 'Bearer 6KkxZddLuW3cPSgX9fDdUsf03trofdnNj8aNCM3I';
  final int perPage = 20;

  Future<ContactsModel> getContacts() async {
    try {
      final response = await client.get(
        "https://apites2.zahironline.com/api/v2/contacts?isort[name]=1&per_page=$perPage",
        headers: {
          "Content-type": "application/json",
          "Authorization": token
        });
      return ContactsModel.fromJson(json.decode(response.body));
    } catch(_) {
      print('Errorrr');
      print(_);
    }

  }
}
