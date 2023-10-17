import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> getmessage(context) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Text("ouiiiii !")),
  );
}
