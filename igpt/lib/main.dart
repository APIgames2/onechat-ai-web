import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_api_client/chatgpt_api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'igpt',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'igpt'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> chatList = [];
  bool sendBtnDisabled = false;
  @override
  initState() {
    super.initState();
    textController.clear();
    setState(() {
      sendBtnDisabled = true;
    });
    // send message
    client.sendMessage("Bonjour", onData: (ChatGptApiResponse response) {
      print(response);
      setState(() {
        chatList.add('ChatGpt:\n ${response.choices[0].text}');
        sendBtnDisabled = false;
      });
    }, onStreamData: (ChatGptApiResponse response) {
      // print(response);
    }, onStreamEnd: () {
      // print('end');
    });
    // print(textController.text);
  }

  /// init client
  ChatGptApiClient client = ChatGptApiClient(
      "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",
      ChatGptModelOption(stream: false, maxPropmtStack: 3));

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  reverse: true,
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 29, 29, 29),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Color.fromARGB(255, 29, 29, 29))),
                      child: Text(chatList[chatList.length - index - 1]),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 9,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        child: CupertinoTextField(
                          controller: textController,
                          style: TextStyle(color: Colors.white),
                          placeholder: "talk with chatgpt",
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                          child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: sendBtnDisabled
                              ? null
                              : () {
                                  String text = textController.text;
                                  textController.clear();
                                  setState(() {
                                    chatList.add('Me:\n $text');
                                    sendBtnDisabled = true;
                                  });
                                  // send message
                                  client.sendMessage(text,
                                      onData: (ChatGptApiResponse response) {
                                    print(response);
                                    setState(() {
                                      chatList.add(
                                          'ChatGpt:\n ${response.choices[0].text}');
                                      sendBtnDisabled = false;
                                    });
                                  }, onStreamData:
                                          (ChatGptApiResponse response) {
                                    // print(response);
                                  }, onStreamEnd: () {
                                    // print('end');
                                  });
                                  // print(textController.text);
                                },
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            )

            // Positioned(
            //   child: Row(children: [Text('23'), Text('444')]),
            //   bottom: 0,
            //   left: 0,
            // )
          ],
        ),
      ),
    );
  }
}
