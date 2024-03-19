import 'package:bloc/bloc.dart';
import 'package:livefriend/model/talktime_model.dart';
import 'package:meta/meta.dart';

part 'talktime_state.dart';

class TalktimeCubit extends Cubit<TalktimeState> {
  TalktimeCubit() : super(TalktimeInitial());
}
