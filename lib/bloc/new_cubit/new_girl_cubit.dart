import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_girl_state.dart';

class NewGirlCubit extends Cubit<NewGirlState> {
  NewGirlCubit() : super(NewGirlInitial());
}
