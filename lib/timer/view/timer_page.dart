import 'package:bloc_tutorial/timer/bloc/timer_bloc.dart';
import 'package:bloc_tutorial/timer/ticker.dart';
import 'package:bloc_tutorial/timer/view/timer_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}