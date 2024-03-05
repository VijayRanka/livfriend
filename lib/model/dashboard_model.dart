class DashboardModel {
  final bool? status;
  final String? message;
  final List<WebsiteResponse>? response;

  DashboardModel({
    this.status,
    this.message,
    this.response,
  });

  DashboardModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        response = (json['response'] as List?)?.map((dynamic e) => WebsiteResponse.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'response' : response?.map((e) => e.toJson()).toList()
  };
}

class WebsiteResponse {
  final String? type;
  final List<Data>? data;

  WebsiteResponse({
    this.type,
    this.data,
  });

  WebsiteResponse.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'type' : type,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final String? id;
  final String? title;
  final String? subTitle;
  final String? subSubTitle;
  final String? description;
  final String? image;
  final String? activestatus;
  final String? rts;

  Data({
    this.id,
    this.title,
    this.subTitle,
    this.subSubTitle,
    this.description,
    this.image,
    this.activestatus,
    this.rts,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        subTitle = json['sub_title'] as String?,
        subSubTitle = json['sub_sub_title'] as String?,
        description = json['description'] as String?,
        image = json['image'] as String?,
        activestatus = json['activestatus'] as String?,
        rts = json['rts'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'sub_title' : subTitle,
    'sub_sub_title' : subSubTitle,
    'description' : description,
    'image' : image,
    'activestatus' : activestatus,
    'rts' : rts
  };
}