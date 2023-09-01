import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/cubits/signup/signup_cubit.dart';
import 'package:flutter_project/views/signup/signup_form.dart';
import 'package:flutter_project/repositories/auth_repository.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (_) => const SignUp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<SignupCubit>(
      create: (_) => SignupCubit(context.read<AuthRepository>()),
      child: const SignUpForm(),
    ));
  }
}
