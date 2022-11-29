import 'package:flutter/material.dart';

class ShowSnackBar {

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarReplace(context, onInsert, text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: "Desfazer",
          textColor: Colors.blue,
          onPressed: () {
            onInsert(text);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
