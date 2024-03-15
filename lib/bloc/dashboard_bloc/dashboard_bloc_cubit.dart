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

    } catch (e) {
      emit(DashboardBlocFailed());
    }
  }
}
