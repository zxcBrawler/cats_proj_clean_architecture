import 'package:cats_ca/core/route/router.dart';
import 'package:cats_ca/core/utils.dart';
import 'package:cats_ca/features/cats/presentation/widget/filter_chips.dart';
import 'package:flutter/material.dart';

class CatsCategories extends StatefulWidget {
  const CatsCategories({super.key});

  @override
  State<CatsCategories> createState() => _CatsCategoriesState();
}

class _CatsCategoriesState extends State<CatsCategories> {
  int selectedItemId = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              trailing: const Icon(Icons.chevron_right),
              title: Text(
                categories[index],
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                router.push('/catCategory', extra: selectedItemId);
              },
              subtitle: FilterChips(
                filterOptions: values,
                onItemSelected: (int value) {
                  selectedItemId = value;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
