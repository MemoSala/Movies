// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Error0 extends StatelessWidget {
  static const String route = "/Error0";
  const Error0({super.key, required this.errorName, required this.errorIcon});
  final String errorName;
  final IconData errorIcon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(errorIcon, color: Colors.white, size: 45),
          Text(
            errorName,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
