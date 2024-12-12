import 'package:bloc_tutorial/counter_app.dart';
import 'package:bloc_tutorial/post_app.dart';
import 'package:bloc_tutorial/timer_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/bloc/authentication_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<String> _titleOptions = <String>[
    'Counter',
    'Timer',
    'Posts',
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    CounterApp(),
    TimerApp(),
    PostApp(),
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

    String formatUserId(String userId) =>
        '${userId.substring(0, 3)}...${userId.substring(userId.length - 3)}';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(_titleOptions[_selectedIndex]),
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
                child: Text(formatUserId(userId)),
              ),
              ...List.generate(_titleOptions.length, (index) {
                return ListTile(
                    title: Text(_titleOptions[index]),
                    selected: _selectedIndex == index,
                    onTap: () {
                      _onItemTapped(index);
                      scaffoldKey.currentState?.closeDrawer();
                    });
              }),
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
