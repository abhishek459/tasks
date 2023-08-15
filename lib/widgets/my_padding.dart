import 'package:flutter/material.dart';

class MyPadding extends StatelessWidget {
  const MyPadding({super.key, this.heightInPercentage, this.widthInPercentage});
  final double? heightInPercentage;
  final double? widthInPercentage;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      height: deviceSize.height * (heightInPercentage ?? 0)/100,
      width: deviceSize.width * (widthInPercentage ?? 0)/100,
    );
  }
}