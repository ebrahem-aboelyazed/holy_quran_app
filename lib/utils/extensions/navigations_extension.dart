import 'package:flutter/material.dart';

extension NavigationsExtension on BuildContext {
  void goTo(Widget page) {
    Navigator.push(this, MaterialPageRoute<dynamic>(builder: (_) => page));
  }

  void replaceCurrent(Widget page) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute<dynamic>(builder: (_) => page),
    );
  }
}
