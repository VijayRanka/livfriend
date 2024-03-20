part of 'girl_detail_cubit.dart';

@immutable
abstract class GirlDetailState {}

class GirlDetailLoaded extends GirlDetailState {
  final GirlDetailModel girlDetailModel;

  GirlDetailLoaded({required this.girlDetailModel});
}

class GirlDetailLoading extends GirlDetailState {}
