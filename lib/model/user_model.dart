class UserModel {
  bool? status;
  String? message;
  UserDetails? userDetails;

  UserModel({this.status, this.message, this.userDetails});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  String? id;
  String? mobileNumber;
  String? nickname;
  String? gender;
  String? dob;
  String? firebaseToken;
  String? mainImage;
  String? rts;
  String? dnd;

  UserDetails(
      {this.id,
      this.mobileNumber,
      this.nickname,
      this.gender,
      this.dob,
      this.firebaseToken,
      this.mainImage,
      this.rts,
      this.dnd});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobileNumber = json['mobile_number'];
    nickname = json['nickname'];
    gender = json['gender'];
    dob = json['dob'];
    firebaseToken = json['firebase_token'];
    mainImage = json['main_image'];
    rts = json['rts'];
    dnd = json['dnd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile_number'] = this.mobileNumber;
    data['nickname'] = this.nickname;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['firebase_token'] = this.firebaseToken;
    data['main_image'] = this.mainImage;
    data['rts'] = this.rts;
    data['dnd'] = this.dnd;
    return data;
  }
}
