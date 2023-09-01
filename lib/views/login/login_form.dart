import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/cubits/login/login_cubit.dart';

import '../signup/signup.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.error) {}
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Logo(),
              const SizedBox(height: 60),
              const Text(
                "SIGN IN",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 35),
              const Text(
                "Email",
                style: TextStyle(fontSize: 14, color: Colors.blueGrey),
              ),
              BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (previous, current) =>
                    previous.email != current.email,
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (email) {
                      context.read<LoginCubit>().emailChanged(email);
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  );
                },
              ),
              const SizedBox(height: 15),
              const Text(
                "Enter Password",
                style: TextStyle(fontSize: 14, color: Colors.blueGrey),
              ),
              BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (previous, current) =>
                    previous.password != current.password,
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (password) {
                      context.read<LoginCubit>().passwordChanges(password);
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                  );
                },
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 15),
              const LoginButton(),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  TextSpan(
                      text: "Register",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(context,
                            MaterialPageRoute(builder: (c) => const SignUp())),
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Image.asset("images/logo.jpg"),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status == LoginStatus.submitting
              ? const Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: () {
                    context.read<LoginCubit>().logInWithCredentials();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ));
        },
      ),
    );
  }
}
