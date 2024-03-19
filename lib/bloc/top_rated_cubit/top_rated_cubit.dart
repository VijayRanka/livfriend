import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livefriend/api/rest_api.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/preference_utils.dart';
import 'package:livefriend/model/girl_model.dart';
import 'package:meta/meta.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit() : super(TopRatedLoaded());

  Future<void> loadGirls() async {
    String userID =
        PreferenceUtils.getString(Constants.userID, defValue: "") ?? "";
    if (userID == "") {
      Fluttertoast.showToast(msg: "No user found");
      return;
    }
    emit(TopRatedLoading());
    await APICalls.getResponse(
        url: Constants.mainServerURL,
        isPost: true,
        body: {"get_top_rated": "1", "user_id": userID}).then((response) {
      GirlModel girlsModel = GirlModel.fromJson(json.decode(response.body));
      emit(TopRatedLoaded(
          normalGirls: girlsModel.allGirls,
          premiumGirls: girlsModel.premiumGirls));
    }).onError((error, stackTrace) {
      emit(TopRatedLoaded());
    });
  }
}
