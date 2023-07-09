import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget textButton({
  required String text,
  required Function() onPressed,
  required bool state,
}) =>
    ConditionalBuilder(
      condition: state,
      builder: (BuildContext context) => SizedBox(
        height: 53,
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xffFF7A00),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xffFFFFFF),
            ),
          ),
        ),
      ),
      fallback: (BuildContext context) =>
          const Center(child: CircularProgressIndicator()),
    );
