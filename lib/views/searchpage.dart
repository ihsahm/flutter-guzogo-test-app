import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          searchBar(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            endIndent: 5,
            indent: 5,
            thickness: 1,
          ),
          searchList()
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Airport",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: 'Search',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          child: const Icon(Icons.search),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget searchList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            "Direct Airports",
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => const Divider(
                  endIndent: 5,
                  indent: 5,
                  thickness: 1,
                ),
            itemCount: 6,
            itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.airplanemode_active),
                    title: Text("Abidjan, Port Bouet Airport (ABJ)"),
                  ),
                ))
      ],
    );
  }
}
