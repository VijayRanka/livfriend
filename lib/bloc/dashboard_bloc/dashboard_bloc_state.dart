part of 'dashboard_bloc_cubit.dart';

@immutable
abstract class DashboardBlocState {}

class DashboardBlocInitial extends DashboardBlocState {
  final List<WebsiteResponse> websiteResponseList;

  DashboardBlocInitial({this.websiteResponseList = const []});
}

class DashboardBlocLoading extends DashboardBlocState {}

class DashboardBlocFailed extends DashboardBlocState {}
