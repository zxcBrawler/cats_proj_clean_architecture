import 'package:cats_ca/core/utils.dart';
import 'package:flutter/material.dart';

class CatsCategories extends StatelessWidget {
  const CatsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(categories[index]),
              onTap: (){
                
              },
            );
          },
        ),
      ),
    );
  }
}
