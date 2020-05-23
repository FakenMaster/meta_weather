import 'package:flutter/material.dart';

class WeatherSearchDelegate extends SearchDelegate {
  WeatherSearchDelegate() : super(searchFieldLabel: '搜索地名');
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Visibility(
        visible: query?.isNotEmpty ?? false,
        child: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
            //showSuggestions(context);
          },
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          //showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("#$index"),
        );
      },
      itemCount: 20,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Visibility(
        visible: false, child: Container()); //return Text("搜索建议");
  }
}
