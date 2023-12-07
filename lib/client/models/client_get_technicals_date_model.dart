class ClientGetTechnicalsDataModel {
  bool? success;
  List<Data>? data;

  ClientGetTechnicalsDataModel({this.success, this.data});

  ClientGetTechnicalsDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? sId;
  String? job;
  String? experience;
  String? gender;
  String? description;
  String? rangeJob;
  String? jobKind;
  List<void>? certificateImg;
  Ratings? ratings;
  User? user;

  Data(
      {this.sId,
      this.job,
      this.experience,
      this.gender,
      this.description,
      this.rangeJob,
      this.jobKind,
      this.certificateImg,
      this.ratings,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    job = json['job'];
    experience = json['experience'];
    gender = json['gender'];
    description = json['description'];
    rangeJob = json['rangeJob'];
    jobKind = json['jobKind'];
    if (json['certificate_img'] != null) {
      certificateImg = <Null>[];
      json['certificate_img'].forEach((v) {
        certificateImg!.add(v.fromJson(v));
      });
    }
    ratings =
        json['ratings'] != null ? Ratings.fromJson(json['ratings']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class Ratings {
  int? avgRating;
  int? count;
  List<RateByUser>? rateByUser;

  Ratings({this.avgRating, this.count, this.rateByUser});

  Ratings.fromJson(Map<String, dynamic> json) {
    avgRating = json['avgRating'];
    count = json['count'];
    if (json['rateByUser'] != null) {
      rateByUser = <RateByUser>[];
      json['rateByUser'].forEach((v) {
        rateByUser!.add(RateByUser.fromJson(v));
      });
    }
  }
}

class RateByUser {
  String? userId;
  int? stars;
  String? sId;

  RateByUser({this.userId, this.stars, this.sId});

  RateByUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    stars = json['stars'];
    sId = json['_id'];
  }


}

class User {
  String? sId;
  String? name;
  String? email;
  String? country;
  String? governorate;
  String? city;
  int? age;
  String? number;
  String? role;
  List<void>? imgPath;
  String? uniqueResetPassStr;
  List<Chats>? chats;

  User(
      {this.sId,
      this.name,
      this.email,
      this.country,
      this.governorate,
      this.city,
      this.age,
      this.number,
      this.role,
      this.imgPath,
      this.uniqueResetPassStr,
      this.chats});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    country = json['country'];
    governorate = json['governorate'];
    city = json['city'];
    age = json['age'];
    number = json['number'];
    role = json['role'];
    if (json['imgPath'] != null) {
      imgPath = <Null>[];
      json['imgPath'].forEach((v) {
        imgPath!.add(v.fromJson(v));
      });
    }
    uniqueResetPassStr = json['uniqueResetPassStr'];
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(Chats.fromJson(v));
      });
    }
  }
}

class Chats {
  String? sender;
  String? receiver;
  String? msg;
  String? sId;
  String? createdAt;

  Chats({this.sender, this.receiver, this.msg, this.sId, this.createdAt});

  Chats.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    receiver = json['receiver'];
    msg = json['msg'];
    sId = json['_id'];
    createdAt = json['createdAt'];
  }
}
