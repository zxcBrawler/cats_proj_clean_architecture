import 'package:cats_ca/core/theme/colors.dart';
import 'package:flutter/material.dart';

class LinearIndicator extends StatelessWidget {
  final int? currentValue;
  const LinearIndicator({super.key, this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          SizedBox(
              height: 30,
              width: double.maxFinite,
              child: LinearProgressIndicator(
                value: currentValue! / 5, // second value after / is max value
                borderRadius: BorderRadius.circular(30),
                color: getColorBasedOnValue(currentValue!),
              )),
          Align(
            alignment: Alignment.center,
            child: Text(
                currentValue != -1 ? currentValue.toString() : "no data",
                style: const TextStyle(fontSize: 20)),
          )
        ]),
      ],
    );
  }
}

Color getColorBasedOnValue(int value) {
  switch (value) {
    case 1:
      return CustomColors.barColor1;
    case 2:
      return CustomColors.barColor2;
    case 3:
      return CustomColors.barColor3;
    case 4:
      return CustomColors.barColor4;
    case 5:
      return CustomColors.barColor5;
    default:
      return Colors.black; // Default color for other cases
  }
}
