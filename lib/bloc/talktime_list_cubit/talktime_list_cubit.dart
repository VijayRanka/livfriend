import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livefriend/api/rest_api.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/preference_utils.dart';
import 'package:livefriend/model/talktime_list_model.dart';
import 'package:meta/meta.dart';

part 'talktime_list_state.dart';

class TalktimeListCubit extends Cubit<TalktimeListState> {
  TalktimeListCubit() : super(TalktimeListLoaded());

  Future<void> getTalkTimeList() async {
    String userID =
        PreferenceUtils.getString(Constants.userID, defValue: "") ?? "";
    if (userID == "") {
      Fluttertoast.showToast(msg: "No user found");
      return;
    }
    var currentState=state;
    List<TalktimeDetails>? tempList=[];
    if(currentState is TalktimeListLoaded){
      if((currentState.talktimeList ?? []).isEmpty){
        emit(TalktimeListLoading());
      }else{
        tempList=currentState.talktimeList;
      }
    }else {
      emit(TalktimeListLoading());
    }
    await APICalls.getResponse(
        url: Constants.mainServerURL,
        isPost: true,
        body: {"talktime_api": "1", "user_id": userID}).then((response) async{
      TalktimeListModel talkTimeModel =
          TalktimeListModel.fromJson(json.decode(response.body));
      if(tempList?.isNotEmpty ?? false){
        if(tempList?.length!=talkTimeModel.talktimeDetails?.length){
          emit(TalktimeListLoading());
          await Future.delayed(const Duration(milliseconds: 500),(){
            emit(TalktimeListLoaded(talktimeList: talkTimeModel.talktimeDetails));
          });
        }
      }else{
        emit(TalktimeListLoaded(talktimeList: talkTimeModel.talktimeDetails));
      }

    }).onError((error, stackTrace) {
      print(error);
      emit(TalktimeListLoaded());
    });
  }
}
