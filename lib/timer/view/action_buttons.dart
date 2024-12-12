import 'package:bloc_tutorial/timer/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ...switch (state) {
            TimerInitial() => [
                FloatingActionButton(
                  heroTag: 'timerInitial_start_floatingActionButton',
                  key: const Key('timerInitial_start_floatingActionButton'),
                  child: const Icon(Icons.play_arrow),
                  onPressed: () => context
                      .read<TimerBloc>()
                      .add(TimerStarted(duration: state.duration)),
                ),
              ],
            TimerRunInProgress() => [
                FloatingActionButton(
                  heroTag: 'timerInProgress_pause_floatingActionButton',
                  key: const Key('timerInProgress_pause_floatingActionButton'),
                  child: const Icon(Icons.pause),
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerPaused()),
                ),
                FloatingActionButton(
                  heroTag: 'timerInProgress_reset_floatingActionButton',
                  key: const Key('timerInProgress_reset_floatingActionButton'),
                  child: const Icon(Icons.replay),
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerReset()),
                ),
              ],
            TimerRunPause() => [
                FloatingActionButton(
                  heroTag: 'timerPause_start_floatingActionButton',
                  key: const Key('timerPause_start_floatingActionButton'),
                  child: const Icon(Icons.play_arrow),
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerResumed()),
                ),
                FloatingActionButton(
                  heroTag: 'timerPause_reset_floatingActionButton',
                  key: const Key('timerPause_reset_floatingActionButton'),
                  child: const Icon(Icons.replay),
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerReset()),
                ),
              ],
            TimerRunComplete() => [
                FloatingActionButton(
                  heroTag: 'timerComplete_reset_floatingActionButton',
                  key: const Key('timerComplete_reset_floatingActionButton'),
                  child: const Icon(Icons.replay),
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerReset()),
                ),
              ]
          }
        ]);
      },
    );
  }
}
