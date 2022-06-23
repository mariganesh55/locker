import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  Color bgColor = Colors.black,
}) {
  final snackBar = SnackBar(
    backgroundColor: bgColor,
    duration: const Duration(seconds: 2),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.left,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then((value) => ScaffoldMessenger.of(context).clearSnackBars());
}
