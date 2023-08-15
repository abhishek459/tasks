import 'package:flutter/material.dart';

class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      // color: Colors.green,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/images/background.jpg'), fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
