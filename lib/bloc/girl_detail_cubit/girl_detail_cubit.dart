import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livefriend/api/rest_api.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/preference_utils.dart';
import 'package:livefriend/model/girl_detail_model.dart';
import 'package:meta/meta.dart';

part 'girl_detail_state.dart';

class GirlDetailCubit extends Cubit<GirlDetailState> {
  GirlDetailCubit()
      : super(
            GirlDetailLoaded(girlDetailModel: GirlDetailModel(status: false)));

  Future<void> getGirlDetails({required String girlId}) async {
    String userID =
        PreferenceUtils.getString(Constants.userID, defValue: "") ?? "";
    if (userID == "") {
      Fluttertoast.showToast(msg: "No user found");
      return;
    }
    emit(GirlDetailLoading());
    await APICalls.getResponse(
        url: Constants.mainServerURL,
        isPost: true,
        body: {
          "get_girl_details": "1",
          "user_id": userID,
          "girl_id": girlId,
        }).then((response) {
      GirlDetailModel girlsModel =
          GirlDetailModel.fromJson(json.decode(response.body));
      if (girlsModel.status ?? false) {
        emit(GirlDetailLoaded(girlDetailModel: girlsModel));
      } else {
        Fluttertoast.showToast(msg: girlsModel.message ?? "No Data Found");
        return;
      }
    }).onError((error, stackTrace) {
      print(error);
      emit(GirlDetailLoaded(girlDetailModel: GirlDetailModel(status: false)));
    });
  }
}
