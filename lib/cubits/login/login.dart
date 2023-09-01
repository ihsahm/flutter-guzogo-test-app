import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/cubits/login/login_form.dart';
import 'package:flutter_project/cubits/signup/signup.dart';
import 'package:flutter_project/components/navbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginForm());
  }
}
