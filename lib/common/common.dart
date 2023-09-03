import 'package:flutter/material.dart';
import 'package:tasks/configurations/navigation_service.dart';

void showErrorSnackBar(String errorText) {
  ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
      .showSnackBar(SnackBar(content: Text(errorText)));
}
