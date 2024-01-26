import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvcs_architecture_task/core/models/users/user_response_model.dart';


class UsersService {
  Future<List<UserReponseModel>> getUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://reqres.in/api/users'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> userList = data['data'];
        List<UserReponseModel> users = userList.map((user) => UserReponseModel.fromJson(user)).toList();
        return users;
      } else {
        throw http.ClientException('Failed to get users: ${response.statusCode}');
      }
    } catch (e) {
      throw http.ClientException('Failed to connect: $e');
    }
  }
}
