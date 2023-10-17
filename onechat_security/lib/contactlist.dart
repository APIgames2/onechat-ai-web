// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'contact.dart';

class Contacts extends StatefulWidget {

  const Contacts({Key? key}) : super(key: key);
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    var contactlist = [
      "Priam chambouvet",
      "Thomas viet",
      "grégoire boury",
      "arthur enert becquey",
      "tristan guyot ber..."
    ];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView.builder(
          itemCount: contactlist.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.person_crop_circle,
                    size: 40,
                  ),
                  Text(contactlist[index]),
                  Expanded(
                    child: Container(),
                  ),
                  CupertinoButton(
                    child: const Icon(
                      CupertinoIcons.arrow_right,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Contact(contactmode: 1,contactSelected: index, index: 5,)),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
