class RegistrationModel {
  RegistrationModel({
    this.name,
    this.email,
    this.img,
    this.role,
    this.id,
    this.country,
    this.city,
    this.governorate,
    this.age,
    this.number,
    this.status,
    this.msg,
  });

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    // if (json['img'] != null) {
    //   img = <Null>[];
    //   json['img'].forEach((v) {
    //     img!.add(Null.fromJson(v));
    //   });
    // }
    role = json['role'];
    id = json['id'];
    country = json['country'];
    city = json['city'];
    governorate = json['governorate'];
    age = json['age'];
    number = json['number'];
    status = json['status'];
    msg = json['msg'];
  }

  String? name;
  String? email;
  List<void>? img;
  String? role;
  String? id;
  String? country;
  String? city;
  String? governorate;
  int? age;
  String? number;
  bool? status;
  String? msg;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    // if (this.img != null) {
    //   data['img'] = this.img!.map((v) => v!.toJson()).toList();
    // }
    data['role'] = role;
    data['id'] = id;
    data['country'] = country;
    data['city'] = city;
    data['governorate'] = governorate;
    data['age'] = age;
    data['number'] = number;
    data['status'] = status;
    data['msg'] = msg;
    return data;
  }
}
