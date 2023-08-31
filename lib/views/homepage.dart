import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _passenger = 0;
  void incrementPassenger() {
    setState(() {
      _passenger++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          topStack(),
          bottomStack(),
          bottomButton(),
        ],
      ),
    );
  }

  Widget topStack() {
    return Stack(
      children: [
        SizedBox(
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
              child: SizedBox(
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
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Return Date",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10",
                    style: TextStyle(color: Colors.blue[700], fontSize: 35),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "May",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        "Wednesday",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                "Passengers",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Passengers",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Done",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Adult"),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Entypo.minus_circled),
                                        onPressed: () {},
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('$_passenger'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                        icon: const Icon(Entypo.plus_circled),
                                        onPressed: incrementPassenger,
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 3,
                    ),
                    Text("1"),
                    SizedBox(
                      width: 18,
                    ),
                    Icon(Icons.person_outline),
                    SizedBox(
                      width: 3,
                    ),
                    Text("0"),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.child_care),
                    SizedBox(
                      width: 3,
                    ),
                    Text("0")
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 40.0, right: 40.0),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            child: const Text(
              "Search Flights",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
