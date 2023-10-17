// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

var switch1 = false;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Future<void> hey() async {
      if (switch1 == true) {
        setState(() {
          switch1 = false;
        });
      } else {
        setState(() {
          switch1 = true;
        });
      }
    }

    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 25),
              ),
              const Spacer(),
              FilledButton.tonal(
                child: const Text("Logout"),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
              )
            ],
          ),
          Row(
            children: [
              Spacer(),
              Text("Use hyper-rapidity"),
              CupertinoSwitch(
                value: switch1,
                onChanged: (value) {
                  hey();
                },
              ),
              Spacer()
            ],
          )
        ],
      ),
    );
  }
}
