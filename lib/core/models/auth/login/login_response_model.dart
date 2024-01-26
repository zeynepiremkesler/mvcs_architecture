import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    final String token;
    final String? error;
    LoginResponseModel({
        required this.token,
         this.error,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        token: json["token"],
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
