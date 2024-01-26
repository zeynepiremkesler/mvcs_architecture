import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvcs_architecture_task/core/models/users/user_response_model.dart';
import 'package:mvcs_architecture_task/core/services/users/user_service.dart';


final userProvider = Provider<UsersService>((ref) => UsersService());
final userDataProvider = FutureProvider<List<UserReponseModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});

