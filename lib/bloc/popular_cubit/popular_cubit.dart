import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());
}
