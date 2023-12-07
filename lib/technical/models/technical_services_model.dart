class TechnicalServicesModel {
  List<Services>? services;
  Ratings? ratings;
  String? sId;
  String? job;
  String? experience;
  String? gender;
  String? description;
  String? rangeJob;
  String? jobKind;
  List<void>? certificateImg;
  String? technicalId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? status;

  TechnicalServicesModel(
      {this.services,
      this.ratings,
      this.sId,
      this.job,
      this.experience,
      this.gender,
      this.description,
      this.rangeJob,
      this.jobKind,
      this.certificateImg,
      this.technicalId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.status});

  TechnicalServicesModel.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    ratings =
        json['ratings'] != null ? Ratings.fromJson(json['ratings']) : null;
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
    technicalId = json['technicalId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    status = json['status'];
  }
}

class Services {
  Ratings? ratings;
  String? sId;
  String? title;
  String? description;
  TechnicalId? technicalId;
  int? price;

  Services(
      {this.ratings,
      this.sId,
      this.title,
      this.description,
      this.technicalId,
      this.price});

  Services.fromJson(Map<String, dynamic> json) {
    ratings =
        json['ratings'] != null ? Ratings.fromJson(json['ratings']) : null;
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    technicalId = json['technicalId'] != null
        ? TechnicalId.fromJson(json['technicalId'])
        : null;
    price = json['price'];
  }
}

class Ratings {
  int? avgRating;
  int? count;
  List<void>? rateByUser;

  Ratings({this.avgRating, this.count, this.rateByUser});

  Ratings.fromJson(Map<String, dynamic> json) {
    avgRating = json['avgRating'];
    count = json['count'];
    if (json['rateByUser'] != null) {
      rateByUser = <Null>[];
      json['rateByUser'].forEach((v) {
        rateByUser!.add(v.fromJson(v));
      });
    }
  }
}

class TechnicalId {
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
  int? iV;

  TechnicalId(
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
      this.iV});

  TechnicalId.fromJson(Map<String, dynamic> json) {
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
    iV = json['__v'];
  }
}
