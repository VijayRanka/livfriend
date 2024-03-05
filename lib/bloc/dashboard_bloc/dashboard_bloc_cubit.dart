import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/preference_utils.dart';
import 'package:livefriend/model/dashboard_model.dart';

part 'dashboard_bloc_state.dart';

class DashboardBlocCubit extends Cubit<DashboardBlocState> {
  DashboardBlocCubit() : super(DashboardBlocInitial());

  Future<void> getDashboardData() async {
    emit(DashboardBlocLoading());
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(Constants.webToAppURL));
      request.fields.addAll({'appkey': Constants.appKey});
      await request.send().then((response) async {
        if (response.statusCode == 200) {
          response.stream.bytesToString().then((responseStream) {
            DashboardModel dashboardModel =
                DashboardModel.fromJson(jsonDecode(responseStream));
            if (dashboardModel.status ?? false) {
              String directLink = PreferenceUtils.getString(
                      Constants.directLink,
                      defValue: Constants.defaultTawkToLink) ??
                  Constants.defaultTawkToLink;
              for (var item in dashboardModel.response ?? []) {
                if (item.type == "directlink") {
                  if (directLink !=
                      (item.data[0].title ?? Constants.defaultTawkToLink)) {
                    PreferenceUtils.setString(Constants.directLink,
                            item.data[0].title ?? Constants.defaultTawkToLink)
                        .then((value) {});
                  }
                }
              }
              emit(DashboardBlocInitial(
                  websiteResponseList: dashboardModel.response ?? []));
            }
          });
        } else {
          Fluttertoast.showToast(msg: "Something Went Wrong");
          emit(DashboardBlocFailed());
        }
      });
    } catch (e) {
      emit(DashboardBlocFailed());
    }
  }
}
