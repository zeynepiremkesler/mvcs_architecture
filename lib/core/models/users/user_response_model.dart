class UserReponseModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserReponseModel({this.id, this.email, this.firstName, this.lastName, this.avatar});

  UserReponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}