import 'package:flutter/material.dart';

class FilterChips extends StatefulWidget {
  final List<int> filterOptions;
  final ValueChanged<int> onItemSelected;

  const FilterChips({
    Key? key,
    required this.filterOptions,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  _FilterChipsState createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  late int selectedItemId;

  @override
  void initState() {
    super.initState();
    selectedItemId = widget.filterOptions.isNotEmpty ? widget.filterOptions.first : -1;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.filterOptions
          .map((option) => FilterChip(
                label: Text(option.toString()),
                selected: option == selectedItemId,
                onSelected: (bool selected) {
                  setState(() {
                    selectedItemId = selected ? option : -1;
                    widget.onItemSelected(selectedItemId);
                  });
                },
              ))
          .toList(),
    );
  }
}
