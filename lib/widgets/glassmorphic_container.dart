import 'dart:ui';

import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatelessWidget {
  const GlassmorphicContainer({
    super.key,
    required this.child,
    required this.start,
    required this.end,
    this.radiusTopRight,
    this.radiusTopLeft,
    this.radiusBottomRight,
    this.radiusBottomLeft,
    this.radiusAll,
  });
  final Widget child;
  final double start;
  final double end;
  final bool? radiusTopRight;
  final bool? radiusTopLeft;
  final bool? radiusBottomRight;
  final bool? radiusBottomLeft;
  final bool? radiusAll;

  Radius getRadius(bool? radiusPresent) {
    if (radiusPresent==null) {
      return const Radius.circular(0);
    } else {
      return const Radius.circular(10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(start),
                Colors.white.withOpacity(end),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: radiusAll != null
                ? const BorderRadius.all(Radius.circular(10))
                : BorderRadius.only(
                    topRight: getRadius(radiusTopRight),
                    topLeft: getRadius(radiusTopLeft),
                    bottomLeft: getRadius(radiusBottomLeft),
                    bottomRight: getRadius(radiusBottomRight),
                  ),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
