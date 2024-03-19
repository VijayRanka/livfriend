class GirlModel {
  final bool? status;
  final String? message;
  final List<AllGirls>? allGirls, premiumGirls;

  GirlModel({
    this.status,
    this.message,
    this.premiumGirls,
    this.allGirls,
  });

  GirlModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        premiumGirls = (json['premium_girls'] as List?)
            ?.map((dynamic e) => AllGirls.fromJson(e as Map<String, dynamic>))
            .toList(),
        allGirls = (json['all_girls'] as List?)
            ?.map((dynamic e) => AllGirls.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'premium_girls': premiumGirls,
        'all_girls': allGirls?.map((e) => e.toJson()).toList()
      };
}

class AllGirls {
  final String? id;
  final String? publicId;
  final String? name;
  final String? status;
  final String? age;
  final String? tagline;
  final String? followers;
  final String? videoPath;
  final String? isPremium;
  final String? mainImage;
  final String? isFake;
  final String? rts;
  final String? activestatus;

  AllGirls({
    this.id,
    this.publicId,
    this.name,
    this.status,
    this.age,
    this.tagline,
    this.followers,
    this.videoPath,
    this.isPremium,
    this.mainImage,
    this.isFake,
    this.rts,
    this.activestatus,
  });

  AllGirls.fromJson(Map<String, dynamic> json)
      : id = json['id']??"",
        publicId = json['public_id']??"",
        name = json['name']??"",
        status = json['status']??"",
        age = json['age']??"",
        tagline = json['tagline']??"",
        followers = json['followers']??"",
        videoPath = json['video_path']??"",
        isPremium = json['is_premium']??"",
        mainImage = json['main_image']??"",
        isFake = json['is_fake']??"",
        rts = json['rts']??"",
        activestatus = json['activestatus']??"";

  Map<String, dynamic> toJson() => {
        'id': id,
        'public_id': publicId,
        'name': name,
        'status': status,
        'age': age,
        'tagline': tagline,
        'followers': followers,
        'video_path': videoPath,
        'is_premium': isPremium,
        'main_image': mainImage,
        'is_fake': isFake,
        'rts': rts,
        'activestatus': activestatus
      };
}
