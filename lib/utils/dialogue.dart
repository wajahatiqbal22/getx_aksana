import 'package:flutter/material.dart';

void showLoadingDailogue(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            width: 15,
          ),
          Text("Loading...")
        ],
      ),
    ),
  );
}
