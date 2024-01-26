import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvcs_architecture_task/product/constants/color_constants.dart';

class ToastWidget {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorConstants.red,
      textColor: ColorConstants.white,
    );
  }
}