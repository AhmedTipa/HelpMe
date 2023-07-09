import 'package:flutter/material.dart';

Widget textForm({
  required TextEditingController controller,
  required FormFieldValidator validation,
  required TextInputType type,
  bool? obscureText,
  Function()? onPressed,
  IconData? suffixIcon,
  IconData? prefixIcon,
  String? hintText,
  ValueChanged<String>? onSubmit,
}) =>
    TextFormField(
      cursorColor: const Color(0xffFF8B00),
      controller: controller,
      validator: validation,
      keyboardType: type,
      obscureText: obscureText ?? false,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(suffixIcon,color: const Color(0xffD9D9D9),),
        ),
        prefixIcon: Icon(prefixIcon, color: const Color(0xffD9D9D9)),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: Color(0xffCFD1D6),
        ),

        fillColor: const Color(0xffFFFFFF),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffFF8B00),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
