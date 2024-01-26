import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvcs_architecture_task/core/models/auth/login/login_request_model.dart';
import 'package:mvcs_architecture_task/core/models/auth/login/login_response_model.dart';
import 'package:mvcs_architecture_task/core/services/auth/auth_service.dart';
import 'package:mvcs_architecture_task/product/widget/toast/toast_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  String? _token;

  String? get token => _token;

  void setToken(String token) {
    _token = token;
  }

  void clearToken() {
    _token = null;
  }
}




class AuthController extends StateNotifier<LoginResponseModel?> {
  final AuthService _authService;
  final AuthManager _authManager;

  AuthController(this._authService, this._authManager) : super(null);

  Future<void> loginUser(LoginRequestModel loginRequestModel) async { 
    try {
      final response = await _authService.loginUser(loginRequestModel);
      _authManager.setToken(response.token);
      saveToken(response.token);
      state = response;
    } catch (e) {
      ToastWidget.showToast(e.toString());
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<bool> validationToken() async{
    String? token = await getToken();
    if(token != null){
        _authManager.setToken(token);
        return true;
    }
    return false;
  }

   Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    _authManager.clearToken();
    
  }
}