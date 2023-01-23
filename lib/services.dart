import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import 'model/usermodel.dart';

class RemoteServices {
  List<UserDetails> rampost = [];
  Future<List<UserDetails>> getData() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ),
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        rampost.add(UserDetails.fromJson(i));
      }
      return rampost;
    } else {
      Get.snackbar('Tect',
          'Server Respond ${response.statusCode}:${response.reasonPhrase}');
    }
    return rampost;
  }
}
