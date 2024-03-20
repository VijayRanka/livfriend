class TalktimeListModel {
  final bool? status;
  final String? message;
  final List<TalktimeDetails>? talktimeDetails;

  TalktimeListModel({
    this.status,
    this.message,
    this.talktimeDetails,
  });

  TalktimeListModel.fromJson(Map<String, dynamic> json)
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
  final int? id;
  final int? amount;
  final int? given;
  final int? isBest;
  final int? activestatus;

  TalktimeDetails({
    this.id,
    this.amount,
    this.given,
    this.isBest,
    this.activestatus,
  });

  TalktimeDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        amount = json['amount'] as int?,
        given = json['given'] as int?,
        isBest = json['is_best'] as int?,
        activestatus = json['activestatus'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'amount' : amount,
    'given' : given,
    'is_best' : isBest,
    'activestatus' : activestatus
  };
}