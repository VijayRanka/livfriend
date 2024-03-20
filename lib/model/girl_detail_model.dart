class GirlDetailModel {
  final bool? status;
  final String? message;
  final Data? data;
  final List<Gallery>? gallery;
  final List<Interests>? interests;
  final List<Language>? language;

  GirlDetailModel({
    this.status,
    this.message,
    this.data,
    this.gallery,
    this.interests,
    this.language,
  });

  GirlDetailModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        gallery = (json['gallery'] as List?)
            ?.map((dynamic e) => Gallery.fromJson(e as Map<String, dynamic>))
            .toList(),
        interests = (json['interests'] as List?)
            ?.map((dynamic e) => Interests.fromJson(e as Map<String, dynamic>))
            .toList(),
        language = (json['language'] as List?)
            ?.map((dynamic e) => Language.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
        'gallery': gallery?.map((e) => e.toJson()).toList(),
        'interests': interests?.map((e) => e.toJson()).toList(),
        'language': language?.map((e) => e.toJson()).toList()
      };
}

class Data {
  final String? id;
  final String? name;
  final String? status;
  final String? age;
  final String? tagline;
  final String? followers;
  final String? videoPath;
  final String? isPremium;
  final String? mainImage;
  final String? isFake;
  final String? follower;
  final String? rts;
  final int audioPrice, videoPrice;
  final String? activestatus;

  Data({
    this.id,
    this.name,
    this.status,
    this.age,
    this.tagline,
    this.followers,
    this.videoPath,
    this.isPremium,
    this.mainImage,
    this.follower,
    this.audioPrice = 0,
    this.videoPrice = 0,
    this.isFake,
    this.rts,
    this.activestatus,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        status = json['status'] as String?,
        age = json['age'] as String?,
        tagline = json['tagline'] as String?,
        followers = json['followers'] as String?,
        videoPath = json['video_path'] as String?,
        isPremium = json['is_premium'] as String?,
        audioPrice = int.parse(json['audio_price']),
        videoPrice = int.parse(json['video_price']),
        follower = json['follower'] as String?,
        mainImage = json['main_image'] as String?,
        isFake = json['is_fake'] as String?,
        rts = json['rts'] as String?,
        activestatus = json['activestatus'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'age': age,
        'tagline': tagline,
        'followers': followers,
        'video_path': videoPath,
        'is_premium': isPremium,
        'follower': follower,
        'main_image': mainImage,
        'audio_price': audioPrice,
        'video_price': videoPrice,
        'is_fake': isFake,
        'rts': rts,
        'activestatus': activestatus
      };
}

class Gallery {
  final String? imagepath;

  Gallery({
    this.imagepath,
  });

  Gallery.fromJson(Map<String, dynamic> json)
      : imagepath = json['imagepath'] as String?;

  Map<String, dynamic> toJson() => {'imagepath': imagepath};
}

class Interests {
  final String? name;

  Interests({
    this.name,
  });

  Interests.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'name': name};
}

class Language {
  final String? name;

  Language({
    this.name,
  });

  Language.fromJson(Map<String, dynamic> json) : name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'name': name};
}
