import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              const Text(
                "SIGN IN",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 35),
              const Text(
                "Email",
                style: TextStyle(fontSize: 14, color: Colors.blueGrey),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 15),
              const Text(
                "Password",
                style: TextStyle(fontSize: 14, color: Colors.blueGrey),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                obscureText: true,
                textInputAction: TextInputAction.done,
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
              loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (c)=> CarInfoScreen()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            elevation: 3,
            shape: RoundedRectangleBorder(
                //to set border radius to button
                borderRadius: BorderRadius.circular(5)),
          ),
          child: const Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )),
    );
  }
}
