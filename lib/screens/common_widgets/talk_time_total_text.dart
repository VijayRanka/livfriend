import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livefriend/bloc/talktime_cubit/talktime_cubit.dart';

class TalkTimeTotalText extends StatelessWidget {
  final TextStyle? textStyle;

  const TalkTimeTotalText({this.textStyle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TalktimeCubit, TalktimeState>(
      builder: (context, state) {
        int talkTime = 0;
        if (state is TalktimeLoaded) {
          talkTime = state.talktime;
        }
        return Text(
          "₹$talkTime",
          style: textStyle ?? const TextStyle(),
          maxLines: 1,
        );
      },
    );
  }
}
