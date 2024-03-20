class TalktimeModel {
  final bool? status;
  final String? message;
  final List<Talktime>? data;
  final int? totalTalkTime;

  TalktimeModel({
    this.status,
    this.message,
    this.data,
    this.totalTalkTime,
  });

  TalktimeModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Talktime.fromJson(e as Map<String,dynamic>)).toList(),
        totalTalkTime = json['totalTalkTime'] as int?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList(),
    'totalTalkTime' : totalTalkTime
  };
}

class Talktime {
  final int? id;
  final int? userId;
  final int? talktimeId;
  final int? amount;
  final int? activestatus;
  final String? rts;
  final dynamic girlId;
  final String? type;
  final int? totalSeconds;
  final String? name;

  Talktime({
    this.id,
    this.userId,
    this.talktimeId,
    this.amount,
    this.activestatus,
    this.rts,
    this.girlId,
    this.type,
    this.totalSeconds,
    this.name,
  });

  Talktime.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        talktimeId = json['talktime_id'] as int?,
        amount = json['amount'] as int?,
        activestatus = json['activestatus'] as int?,
        rts = json['rts'] as String?,
        girlId = json['girl_id'],
        type = json['type'] as String?,
        totalSeconds = json['total_seconds'] as int?,
        name = json['name'] ?? "";

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'talktime_id' : talktimeId,
    'amount' : amount,
    'activestatus' : activestatus,
    'rts' : rts,
    'girl_id' : girlId,
    'type' : type,
    'total_seconds' : totalSeconds,
    'name' : name
  };
}