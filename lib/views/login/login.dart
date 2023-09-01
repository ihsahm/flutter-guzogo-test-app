import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/views/login/login_form.dart';
import 'package:flutter_project/repositories/auth_repository.dart';

import '../../cubits/login/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (_) => LoginCubit(
        context.read<AuthRepository>(),
      ),
      child: const LoginForm(),
    ));
  }
}
