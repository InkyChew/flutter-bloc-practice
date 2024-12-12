import 'package:bloc_tutorial/timer/view/background.dart';
import 'package:bloc_tutorial/timer/view/action_buttons.dart';
import 'package:bloc_tutorial/timer/view/timer_text.dart';
import 'package:flutter/material.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              ActionButtons(),
            ],
          ),
        ],
      ),
    );
  }
}
