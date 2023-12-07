class TechnicalCompleteModel {
  bool? status;
  Technical? technical;

  TechnicalCompleteModel({this.status, this.technical});

  TechnicalCompleteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    technical = json['Technical'] != null
        ? Technical.fromJson(json['Technical'])
        : null;
  }
}

class Technical {
  Ratings? ratings;
  String? sId;
  String? job;
  String? experience;
  String? gender;
  String? description;
  String? rangeJob;
  String? jobKind;
  List<Null>? certificateImg;
  String? technicalId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Technical(
      {this.ratings,
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
      this.iV});

  Technical.fromJson(Map<String, dynamic> json) {
    ratings =
        json['ratings'] != null ? Ratings.fromJson(json['ratings']) : null;
    sId = json['_id'];
    job = json['job'];
    experience = json['experience'];
    gender = json['gender'];
    description = json['description'];
    rangeJob = json['rangeJob'];
    jobKind = json['jobKind'];
    // if (json['certificate_img'] != null) {
    //   certificateImg = <Null>[];
    //   json['certificate_img'].forEach((v) {
    //     certificateImg!.add(new Null.fromJson(v));
    //   });
    // }
    technicalId = json['technicalId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class Ratings {
  int? avgRating;
  int? count;
  List<Null>? rateByUser;

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
