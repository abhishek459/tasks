import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tasks/configurations/isar_service.dart';
import 'package:tasks/configurations/navigation_service.dart';

class ServerService {
  static Future<void> fetchServerLink() async {
    final uri = Uri.parse(
        'https://dev-qq4arozjewbye2v.api.raw-labs.com/json-programming-heroes');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        String serverLink = jsonData['url'];
        if (serverLink.isNotEmpty) {
          await IsarService.saveServerLink(serverLink).whenComplete(
            () => fetchLastModifiedTime(),
          );
        } else {
          fetchLastModifiedTime();
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
          .showSnackBar(
              SnackBar(content: Text('Something went wrong: ${e.toString()}')));
    }
  }

  static Future<void> fetchLastModifiedTime() async {}
}
