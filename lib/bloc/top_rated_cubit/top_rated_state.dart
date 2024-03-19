part of 'top_rated_cubit.dart';

@immutable
abstract class TopRatedState {}

class TopRatedLoaded extends TopRatedState {
  final List<AllGirls>? premiumGirls, normalGirls;

  TopRatedLoaded({this.premiumGirls = const [], this.normalGirls = const []});
}

class TopRatedLoading extends TopRatedState {}
