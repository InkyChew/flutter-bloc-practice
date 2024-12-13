import 'package:bloc_tutorial/counter_app.dart';
import 'package:bloc_tutorial/post_app.dart';
import 'package:bloc_tutorial/timer_app.dart';
import 'package:bloc_tutorial/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication/bloc/authentication_bloc.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const CounterApp(),
    const TimerApp(),
    const PostApp(),
    WeatherApp(weatherRepository: WeatherRepository()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final userId = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.id,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                ),
                child: Text(userId),
              ),
              ListTile(
                title: const Text('Counter'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                },
              ),
              ListTile(
                title: const Text('Timer'),
                selected: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  scaffoldKey.currentState?.closeDrawer();
                },
              ),
              ListTile(
                title: const Text('Posts'),
                selected: _selectedIndex == 2,
                onTap: () {
                  _onItemTapped(2);
                  scaffoldKey.currentState?.closeDrawer();
                },
              ),
              ListTile(
                title: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Logout'),
                  ],
                ),
                onTap: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutPressed());
                  scaffoldKey.currentState?.closeDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
