class ClientServicesModel {
  List<Services>? services;
  bool? status;

  ClientServicesModel({this.services, this.status});

  ClientServicesModel.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    status = json['status'];
  }


}

class Services {
  String? sId;
  String? title;
  String? description;
  int? price;
  Ratings? ratings;
  UserData? userData;
  TechData? techData;

  Services(
      {this.sId,
      this.title,
      this.description,
      this.price,
      this.ratings,
      this.userData,
      this.techData});

  Services.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    ratings =
        json['ratings'] != null ? Ratings.fromJson(json['ratings']) : null;
    userData =
        json['userData'] != null ? UserData.fromJson(json['userData']) : null;
    techData =
        json['techData'] != null ? TechData.fromJson(json['techData']) : null;
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

class UserData {
  String? sId;
  String? name;
  String? email;
  String? country;
  String? governorate;
  String? city;
  int? age;
  String? number;
  String? role;
  List<Null>? imgPath;

  UserData(
      {this.sId,
      this.name,
      this.email,
      this.country,
      this.governorate,
      this.city,
      this.age,
      this.number,
      this.role,
      this.imgPath});

  UserData.fromJson(Map<String, dynamic> json) {
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
  }
}

class TechData {
  String? sId;
  String? job;
  String? experience;
  String? gender;
  String? description;
  String? rangeJob;
  String? jobKind;
  List<Null>? certificateImg;
  Ratings? ratings;

  TechData(
      {this.sId,
      this.job,
      this.experience,
      this.gender,
      this.description,
      this.rangeJob,
      this.jobKind,
      this.certificateImg,
      this.ratings});

  TechData.fromJson(Map<String, dynamic> json) {
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
  }
}

// class Ratings {
//   int? avgRating;
//   int? count;
//   List<Null>? rateByUser;
//
//   Ratings({this.avgRating, this.count, this.rateByUser});
//
//   Ratings.fromJson(Map<String, dynamic> json) {
//     avgRating = json['avgRating'];
//     count = json['count'];
//     if (json['rateByUser'] != null) {
//       rateByUser = <Null>[];
//       json['rateByUser'].forEach((v) {
//         rateByUser!.add(new Null.fromJson(v));
//       });
//     }
//   }
//
//
// }
