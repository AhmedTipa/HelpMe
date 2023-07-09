import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

void flutterToastr(
  BuildContext context, {
  required String msg,
 required Color color,
}) =>
    FlutterToastr.show(
      msg,
      context,
      position: FlutterToastr.bottom,
      backgroundColor: color,
      duration: FlutterToastr.lengthLong,
    );
