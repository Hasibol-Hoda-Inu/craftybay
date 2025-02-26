import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String message, [bool isErrorMessage = true]){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white),),
        backgroundColor: isErrorMessage? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
      ));
}