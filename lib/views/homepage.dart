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
      body: Column(
        children: [
          topStack(),
          bottomStack(),
        ],
      ),
    );
  }

  Widget topStack() {
    bool isReturnActive = true;
    bool isOneWayActive = false;
    return Stack(
      children: [
        Container(
          height: 430,
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
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(10)),
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
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
              width: 390,
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
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              "ADD",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Addis Ababa",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              "Bole International Airport",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60.0),
                        child: RawMaterialButton(
                          onPressed: () {},
                          shape: const CircleBorder(),
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: const Icon(Icons.airplanemode_active),
                        ),
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
                            SizedBox(
                              height: 20,
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

  Widget bottomStack() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                "Departure Date",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "25",
                    style: TextStyle(color: Colors.blue[700], fontSize: 35),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apr",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        "Tuesday",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                height: 2,
                color: Colors.grey,
              ),
              const Text(
                "Cabin Class",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const Text(
                "Economy",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
