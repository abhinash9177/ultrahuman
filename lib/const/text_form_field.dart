import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    Key? key,
    required this.contoller,
    required this.hint,
    required this.label,
    required this.error,
  }) : super(key: key);
  final TextEditingController contoller;
  final String hint;
  final String label;
  final String error;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: widget.contoller,
      style: const TextStyle(color: Color(0xffFFFFFF)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20, top: 13, bottom: 13),
        filled: true,
        fillColor: Theme.of(context).highlightColor,
        helperText: ' ',
        errorStyle: TextStyle(
          color: Theme.of(context).errorColor,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(14.0)),
          borderSide: BorderSide(
            color: Theme.of(context).highlightColor,
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(14.0)),
          borderSide: BorderSide(
            color: Theme.of(context).highlightColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: Theme.of(context).highlightColor,
            width: 1.0,
          ),
        ),
        prefix: const Text(
          '+91',
          style: TextStyle(fontSize: 16, color: Color(0xffFFFFFF)),
        ),
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 16, color: const Color.fromARGB(255, 223, 223, 223)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.error;
        } else if (value.length < 10 || value.length > 10) {
          return 'Please enter 10 digits phone number';
        }
        return null;
      },
    );
  }
}
