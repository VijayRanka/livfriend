class TalktimeModel {
  final bool? status;
  final String? message;
  final List<TalktimeDetails>? talktimeDetails;

  TalktimeModel({
    this.status,
    this.message,
    this.talktimeDetails,
  });

  TalktimeModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        talktimeDetails = (json['talktime_details'] as List?)?.map((dynamic e) => TalktimeDetails.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'talktime_details' : talktimeDetails?.map((e) => e.toJson()).toList()
  };
}

class TalktimeDetails {
  final String? id;
  final String? amount;
  final String? given;
  final String? isBest;
  final String? activestatus;

  TalktimeDetails({
    this.id,
    this.amount,
    this.given,
    this.isBest,
    this.activestatus,
  });

  TalktimeDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        amount = json['amount'] as String?,
        given = json['given'] as String?,
        isBest = json['is_best'] as String?,
        activestatus = json['activestatus'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'amount' : amount,
    'given' : given,
    'is_best' : isBest,
    'activestatus' : activestatus
  };
}
