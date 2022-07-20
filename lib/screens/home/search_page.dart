import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelagate(),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Center(
        child: TextFormField(
          controller: controller,
          onChanged: (v) {},
        ),
      ),
    );
  }
}

class MySearchDelagate extends SearchDelegate {
  
  List<String> searchResult = [
    "home",
    "mouse",
    "mushu",
    "kuchu",
    "it",
    "sabzi",
    "dars",
    "olma",
    "quyosh",
    "shoptoli",
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(
            Icons.clear,
          ),
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> listOfStrings = searchResult.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: listOfStrings.length,
      itemBuilder: (context, index) {
        final item = listOfStrings[index];
        return ListTile(
          title: Text(item),
          onTap: () {
            query = item;
          },
        );
      },
    );
  }
}
