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
      body: Column(
        children: [searchBar()],
      ),
    );
  }

  Widget searchBar() {
    return CustomScrollView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          floating: true,
          pinned: true,
          snap: false,
          centerTitle: false,
          title: const Text('Select Airport'),
          actions: [
            TextButton(
              child: const Text("Canccel"),
              onPressed: () {},
            ),
          ],
          bottom: AppBar(
            automaticallyImplyLeading: false,
            title: Container(
              width: double.infinity,
              height: 60,
              color: Colors.grey[200],
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
          ),
        ),
        // Other Sliver Widgets
        SliverList(
          delegate: SliverChildListDelegate([
            const SizedBox(
              height: 400,
              child: Center(
                child: Text(
                  'This is an awesome shopping platform',
                ),
              ),
            ),
            Container(
              height: 1000,
              color: Colors.pink,
            ),
          ]),
        ),
      ],
    );
  }
}
