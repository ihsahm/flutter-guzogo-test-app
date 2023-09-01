import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/views/login/login.dart';
import 'package:flutter_project/cubits/signup/signup_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: BlocListener<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state.status == SignupStatus.error) {}
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Logo(),
              const SizedBox(height: 40),
              const Text(
                "REGISTER",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 35),
              const Text(
                "Full Name",
                style: TextStyle(fontSize: 14, color: Colors.blueGrey),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 15),
              const Text(
                "Email",
                style: TextStyle(fontSize: 14, color: Colors.blueGrey),
              ),
              BlocBuilder<SignupCubit, SignupState>(
                buildWhen: (previous, current) =>
                    previous.email != current.email,
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (email) {
                      context.read<SignupCubit>().emailChanged(email);
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
              BlocBuilder<SignupCubit, SignupState>(
                buildWhen: (previous, current) =>
                    previous.password != current.password,
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (password) {
                      context.read<SignupCubit>().passwordChanges(password);
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
              const LoginButton(),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  TextSpan(
                      text: "Sign In",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const LoginPage())),
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

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: BlocBuilder<SignupCubit, SignupState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status == SignupStatus.submitting
              ? const Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: () {
                    context.read<SignupCubit>().signupdFormSubmitted();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Text(
                    "Register",
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
