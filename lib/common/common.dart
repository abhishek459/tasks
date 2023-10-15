import 'package:flutter/material.dart';
import 'package:tasks/configurations/navigation_service.dart';

void showSnackBar(String snackBarText) {
  ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
      .showSnackBar(SnackBar(content: Text(snackBarText)));
}
