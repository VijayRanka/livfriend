import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livefriend/api/rest_api.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/preference_utils.dart';
import 'package:livefriend/model/talktime_detail_model.dart';
import 'package:meta/meta.dart';

part 'talktime_state.dart';

class TalktimeCubit extends Cubit<TalktimeState> {
  TalktimeCubit() : super(TalktimeLoaded());

  Future<void> getUserTalkTime() async {
    String userID =
        PreferenceUtils.getString(Constants.userID, defValue: "") ?? "";
    if (userID == "") {
      Fluttertoast.showToast(msg: "No user found");
      return;
    }
    emit(TalktimeLoading());
    await APICalls.getResponse(
            url: Constants.mainServerURL,
            isPost: true,
            body: {"get_talktime_details": "1", "user_id": userID})
        .then((response) {
      TalktimeModel talkTimeModel =
          TalktimeModel.fromJson(json.decode(response.body));
      emit(TalktimeLoaded(
          talktime: talkTimeModel.totalTalkTime ?? 0,
          talkTimeList: talkTimeModel.data ?? []));
    }).onError((error, stackTrace) {
      emit(TalktimeLoaded());
    });
  }

  int getCurrentTalkTime(){
    int talkTime=0;
    var currentState=state;
    if(currentState is TalktimeLoaded){
      talkTime=currentState.talktime;
    }
    return talkTime;
  }
}
