import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvcs_architecture_task/core/controllers/auth/auth_controller.dart';
import 'package:mvcs_architecture_task/core/models/auth/login/login_response_model.dart';
import 'package:mvcs_architecture_task/core/services/auth/auth_service.dart';

final apiServiceProvider = Provider<AuthService>((ref) => AuthService());
final authManagerProvider = Provider<AuthManager>((ref) => AuthManager());

final authProvider = StateNotifierProvider<AuthController, LoginResponseModel?>((ref) {
  final apiService = ref.read(apiServiceProvider);
  final authManager = ref.read(authManagerProvider);
  return AuthController(apiService, authManager);
});
