import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_girls_state.dart';

class AllGirlsCubit extends Cubit<AllGirlsState> {
  AllGirlsCubit() : super(AllGirlsInitial());
}
