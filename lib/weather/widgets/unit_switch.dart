import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:bloc_tutorial/weather/cubit/weather_cubit.dart';

class UnitSwitch extends StatelessWidget {
  const UnitSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 50,
      customTextStyles: const [
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
      ],
      activeFgColor: Colors.white,
      activeBgColors: const [
        [Colors.transparent],
        [Colors.transparent]
      ],
      inactiveBgColor: Colors.transparent,
      initialLabelIndex: 1,
      totalSwitches: 2,
      labels: const ['F', 'C'],
      onToggle: (index) {
        context.read<WeatherCubit>().toggleUnits();
      },
    );
  }
}
