import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: topStack(),
    );
  }

  Widget topStack() {
    return Stack(
      children: [
        Container(
          height: 400,
          width: double.infinity,
          child: Image.asset(
            "images/guzo.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 50,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 4),
                  borderRadius: BorderRadius.circular(5)),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  )),
            )),
        Positioned(
          top: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Return",
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "One-Way",
                          style: TextStyle(color: Colors.white),
                        ))
                  ]),
            ),
          ),
        ),
        Positioned(
            top: 230,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                height: 200,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Column(
                          children: [
                            Text(
                              "From",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "ADD",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28),
                            ),
                            Text(
                              "Addis Ababa",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "Bole International Airport",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        shape: const CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        child: const Icon(Icons.airplanemode_active),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Column(
                          children: [
                            Text(
                              "To",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "Select Destination",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ))
      ],
    );
  }
}
