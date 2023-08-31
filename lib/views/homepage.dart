import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  Widget topStack() {
    return Stack(
      children: [
        Container(
          height: 400,
          width: double.infinity,
          child: Image.asset("images/guzo.jpg"),
        )
      ],
    );
  }
}
