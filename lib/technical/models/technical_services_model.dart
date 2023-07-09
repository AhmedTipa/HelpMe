class TechnicalServicesModel {
  Service? service;
  String? msg;
  bool? status;

  TechnicalServicesModel({this.service, this.msg, this.status});

  TechnicalServicesModel.fromJson(Map<String, dynamic> json) {
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
    msg = json['msg'];
    status = json['status'];
  }
}

class Service {
  String? title;
  String? description;
  String? technicalId;
  int? price;
  Ratings? ratings;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Service(
      {this.title,
      this.description,
      this.technicalId,
      this.price,
      this.ratings,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Service.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    technicalId = json['technicalId'];
    price = json['price'];
    ratings =
        json['ratings'] != null ? Ratings.fromJson(json['ratings']) : null;
    sId = json['_id'];
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
    // if (json['rateByUser'] != null) {
    //   rateByUser = <Null>[];
    //   json['rateByUser'].forEach((v) {
    //     rateByUser!.add(Null.fromJson(v));
    //   });
    // }
  }
}
