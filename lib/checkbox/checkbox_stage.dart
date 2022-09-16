import 'dart:html';

import 'package:flutter/cupertino.dart';

class CheckboxStage {
  final String title;
  bool value;

  CheckboxStage({
    required this.title,
    this.value = false,
  });
}
