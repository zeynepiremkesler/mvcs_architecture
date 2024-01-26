import 'package:mvcs_architecture_task/core/services/users/user_service.dart';
import 'package:mvcs_architecture_task/product/widget/toast/toast_widget.dart';

class UserController {
  final UsersService _usersService;

  UserController(this._usersService);

  Future<void> getUsers() async { 
    try {
      await _usersService.getUsers();
    } catch (e) {
      ToastWidget.showToast(e.toString());
    }
  }
}
