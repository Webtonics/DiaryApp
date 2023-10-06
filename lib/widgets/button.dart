import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.text,
    this.onpressed,
  });
  final text;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: onpressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54,
                padding: const EdgeInsets.all(23),
                minimumSize: const Size(double.infinity, 72)),
            child: Text(text)),
      ),
    );
  }
}
