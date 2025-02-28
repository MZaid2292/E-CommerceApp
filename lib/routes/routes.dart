import 'package:flutter/material.dart';

class PageRouting {
  static Future<void> goToNextPage({
    required BuildContext context,
    required Widget navigateTo,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => navigateTo,
      ),
    );
  }
}