import 'package:flutter/material.dart';

class MyTextFields extends StatelessWidget {
  const MyTextFields(
      {super.key, required this.controller, required this.label});
  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(label),
        ),
      ),
    );
  }
}
