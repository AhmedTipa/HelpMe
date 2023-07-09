import 'package:flutter/material.dart';

Widget radioAndText({
  required String text,
  required String text1,
  required String value1,
  required dynamic groupValue1,
  required dynamic onPress1,
  required String text2,
  required String value2,
  required dynamic groupValue2,
  required dynamic onPress2,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.orange,
            fontWeight: FontWeight.w800,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio<String>(
              value: value1,
              groupValue: groupValue1,
              activeColor: Colors.orangeAccent,
              fillColor: MaterialStateProperty.all(Colors.orange),
              onChanged: onPress1,
            ),
            Text(
              text1,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Radio<String>(
              value: value2,
              groupValue: groupValue2,
              activeColor: Colors.orangeAccent,
              fillColor: MaterialStateProperty.all(Colors.orange),
              onChanged: onPress2,
            ),
            Text(
              text2,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
