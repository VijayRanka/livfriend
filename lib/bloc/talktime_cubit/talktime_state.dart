part of 'talktime_cubit.dart';

@immutable
abstract class TalktimeState {}

class TalktimeInitial extends TalktimeState {
  final int talktime;
  final List<TalktimeModel> talkTimeList;

  TalktimeInitial({this.talktime = 0, this.talkTimeList = const []});
}
