import 'package:bloc_tutorial/counter/counter.dart';
import 'package:flutter/material.dart';

class CounterApp extends MaterialApp {
  const CounterApp({super.key})
      : super(debugShowCheckedModeBanner: false, home: const CounterPage());
}
