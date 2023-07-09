import 'package:flutter/material.dart';

Future<void> navigateTo(BuildContext context, Widget widget) async =>
    Navigator.push(
      context,
      MaterialPageRoute<Widget>(builder: (BuildContext context) => widget),
    );
