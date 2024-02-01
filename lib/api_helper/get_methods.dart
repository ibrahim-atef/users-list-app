import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_list_app/model/user_model.dart';

const String baseUrl = "https://jsonplaceholder.typicode.com/users/";

class GetMethods {
  Future<List<User>> getAllUsers() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> responseBody = jsonDecode(response.body);
        return responseBody.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (error) {
      rethrow; // Rethrow the caught error to preserve stack trace
    }
  }

  Future<User> getUserById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$id'));
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return User.fromJson(responseBody);
      } else {
        throw Exception('Failed to load user data for id: $id');
      }
    } catch (error) {
      rethrow; // Rethrow the caught error to preserve stack trace
    }
  }
}
