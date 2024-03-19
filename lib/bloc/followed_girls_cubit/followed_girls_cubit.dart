import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'followed_girls_state.dart';

class FollowedGirlsCubit extends Cubit<FollowedGirlsState> {
  FollowedGirlsCubit() : super(FollowedGirlsInitial());
}
