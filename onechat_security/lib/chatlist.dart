// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

var messages = [];

var userid = [];

var number = 1;

var numberapp = 2;

var send = "";

var windex = 1;

var id = "";

class ChatList extends StatefulWidget {
  const ChatList({Key? key, required this.index, this.message, this.number})
      : super(key: key);
  final int index;
  final message;
  final number;

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final ScrollController _scrollController = ScrollController();
  asyncapp() {}
  User? user = FirebaseAuth.instance.currentUser;
  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  });
    FirebaseDatabase.instance
        .ref("message/groupes/${widget.index}/messages")
        .onValue
        .listen((event) async {
      print(event.snapshot.value);
      setMessage(event.snapshot);

      //getmessage();
    });
  }

  setMessage(messagesList) {
    var messagesappp = [];
    var useridapp = [];
    List<Map<String, dynamic>> nouvelleListe = (messagesList.value as List)
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
    print(nouvelleListe[0]["name"]);
    print(windex);
    for (var i = 0; i < messagesList.children.length; i++) {
      messagesappp.add(nouvelleListe[i]["name"].toString());
      useridapp.add(nouvelleListe[i]["userid"].toString());
    }
    setState(() {
      messages = messagesappp;
      userid = useridapp;
      numberapp = messagesList.children.length;
    });
  }
  @override
  Widget build(BuildContext context) {
    asyncapp();
    if (messages.isEmpty) {
      return const Text("null");
    } else {
      return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                    controller: _scrollController, // Ajout du controller ici

                itemCount: numberapp,
                itemBuilder: (context, index2) {
                  if (userid[index2] != user!.uid) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: MessageLeft(index2, widget.index, messages),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: MessageRight(index2, widget.index, messages),
                    );
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CupertinoSearchTextField(
                            onChanged: (value) {
                              send = value;
                            },
                            placeholder: "send a message",
                            prefixIcon: Text(""),
                          )),
                    ),
                  ),
                ),
                CupertinoButton(
                  child: const Icon(
                    Icons.send_rounded,
                    color: CupertinoColors.activeGreen,
                    size: 30,
                  ),
                  onPressed: () async {
                    print('Message will be send');
                    // Obtenez l'ID de l'utilisateur
                    String uid = user!.uid;

                    DatabaseReference ref = FirebaseDatabase.instance
                        .ref("message/groupes/${widget.index}/messages");

                    await ref.update({
                      "${messages.length}": {"name": send, "userid": uid},
                    });
                    print("Message sent : ${messages.length}");
                  },
                )
              ],
            )
          ],
        ),
      );
    }
  }
  
}

Widget MessageRight(index2, index, messages) {
  return Row(
    children: [
      Expanded(
        child: Container(),
      ),
      Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: CupertinoColors.activeBlue,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  messages[index2],
                  style: const TextStyle(color: CupertinoColors.white),
                ),
              ),
            ),
          ),
          Text(
            messages[index2],
            style: const TextStyle(
                color: CupertinoColors.systemGrey, fontSize: 15),
          ),
        ],
      )
    ],
  );
}

Widget MessageLeft(index2, index, messages) {
  return Row(
    children: [
      Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: CupertinoColors.activeGreen,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  messages[index2],
                  style: const TextStyle(color: CupertinoColors.white),
                ),
              ),
            ),
          ),
          Text(
            messages[index2],
            style: const TextStyle(
                color: CupertinoColors.systemGrey, fontSize: 15),
          ),
        ],
      ),
      Expanded(
        child: Container(),
      )
    ],
  );
}
