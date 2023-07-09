class RegistrationTechnicalModel {

  RegistrationTechnicalModel({this.status, this.technical});

  RegistrationTechnicalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    technical = json['Technical'] != null
        ? Technical.fromJson(json['Technical'])
        : null;
  }
  bool? status;
  Technical? technical;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (technical != null) {
      data['Technical'] = technical!.toJson();
    }
    return data;
  }
}

class Technical {

  Technical(
      {this.job,
      this.experience,
      this.gender,
      this.description,
      this.rangeJob,
      this.jobKind,
      this.certificateImg,
      this.technicalId,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV,});

  Technical.fromJson(Map<String, dynamic> json) {
    job = json['job'];
    experience = json['experience'];
    gender = json['gender'];
    description = json['description'];
    rangeJob = json['rangeJob'];
    jobKind = json['jobKind'];
    // if (json['certificate_img'] != null) {
    //   certificateImg = <Null>[];
    //   json['certificate_img'].forEach((v) {
    //     certificateImg!.add(Null.fromJson(v));
    //   });
    // }
    technicalId = json['technicalId'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
  String? job;
  String? experience;
  String? gender;
  String? description;
  String? rangeJob;
  String? jobKind;
  List<void>? certificateImg;
  String? technicalId;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job'] = job;
    data['experience'] = experience;
    data['gender'] = gender;
    data['description'] = description;
    data['rangeJob'] = rangeJob;
    data['jobKind'] = jobKind;
    // if (this.certificateImg != null) {
    //   data['certificate_img'] =
    //       this.certificateImg!.map((v) => v.toJson()).toList();
    // }
    data['technicalId'] = technicalId;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
