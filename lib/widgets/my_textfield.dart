import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.textInputAction,
    this.textCapitalization,
  });
  final String labelText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      controller: controller,
      focusNode: focusNode,
      maxLines: maxLines,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
    );
  }
}
