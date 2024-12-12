import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_tutorial/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12),
      child: BlocProvider(
        create: (context) => LoginBloc(
            authenticationRepository: context.read<AuthenticationRepository>()),
        child: const LoginForm(),
      ),
    ));
  }
}
