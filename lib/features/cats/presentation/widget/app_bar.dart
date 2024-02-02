import 'package:flutter/material.dart';

PreferredSizeWidget catsAppBar(){
  return AppBar(title: const Text('My cat app'), actions: [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          //showSearch(context: context, delegate: CustomSearchDelegate());
        },
      ),
    ]);
}