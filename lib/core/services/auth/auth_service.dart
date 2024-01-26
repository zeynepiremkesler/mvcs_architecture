import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvcs_architecture_task/core/models/auth/login/login_request_model.dart';
import 'package:mvcs_architecture_task/core/models/auth/login/login_response_model.dart';

class AuthService {
  Future<LoginResponseModel> loginUser(LoginRequestModel loginRequestModel) async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: loginRequestModel.toJson(),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return LoginResponseModel.fromJson(data);
      } else {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        final String errorMessage = errorData['error'] ?? 'Bilinmeyen bir hata oluştu';
        throw http.ClientException(errorMessage);
      }
    } catch (e) {
      throw http.ClientException(e.toString());
    }
  }
}