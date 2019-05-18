import 'dart:convert';

import 'package:zahir_online_clone/models/contacts_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' show Client, Response;

class GeneralListSource {
  Client client = Client();
  final token = 'Bearer uGr8CNxl5FcDoakZr0TnFHFvxeXgLM8nXcDMyxj9';

  Future<Response> getGeneralList(String url) async {
    try {
      final response = await client.get(
        url,
        headers: {
          "Content-type": "application/json",
          "Authorization": token
        });
        print(response);
        return response;
    } catch(_) {
      print(_);
      return _;
    }
  }
}
