import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String message, [bool isErrorMessage = false]){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white),),
        backgroundColor: isErrorMessage? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 12,),
      ));
}