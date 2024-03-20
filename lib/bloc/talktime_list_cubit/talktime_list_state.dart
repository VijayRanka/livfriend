part of 'talktime_list_cubit.dart';

@immutable
abstract class TalktimeListState {}

class TalktimeListLoaded extends TalktimeListState {
  List<TalktimeDetails>? talktimeList;
  TalktimeListLoaded({this.talktimeList=const []});
}
class TalktimeListLoading extends TalktimeListState {}
