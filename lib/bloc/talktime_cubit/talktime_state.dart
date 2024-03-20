part of 'talktime_cubit.dart';

@immutable
abstract class TalktimeState {}

class TalktimeLoaded extends TalktimeState {
  final int talktime;
  final List<Talktime> talkTimeList;

  TalktimeLoaded({this.talktime = 0, this.talkTimeList = const []});
}

class TalktimeLoading extends TalktimeState {}
