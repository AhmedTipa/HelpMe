class LoginModel {


  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json['email'];
    status = json['status'];
    id = json['_id'];
    role = json['role'];
    country = json['country'];
    city = json['city'];
    governorate = json['governorate'];
    age = json['age'];
    number = json['number'];
    token = json['token'];
  }

  String? name;
  String? email;
  bool? status;
  String? id;
  String? role;
  String? country;
  String? city;
  String? governorate;
  int? age;
  String? number;
  String? token;


}
