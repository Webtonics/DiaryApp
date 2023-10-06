import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(this.title, this.description, this.keyboardType,
      {super.key});

  final String title;
  final String description;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          label: Text(title),
          hintStyle: const TextStyle(color: Colors.white),
          hintText: description,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2))),
    );
  }
}
