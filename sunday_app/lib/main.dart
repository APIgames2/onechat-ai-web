import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Text("hi"),
      ),
    );
  }
}

class Groupes_ui extends StatefulWidget {
  const Groupes_ui({super.key});

  @override
  State<Groupes_ui> createState() => _Groupes_uiState();
}

class _Groupes_uiState extends State<Groupes_ui> {
  @override
  Widget build(BuildContext context) {
    bool isMobile(context) => MediaQuery.of(context).size.width < 680;
    if (isMobile(context)) {
      return Container(
        height: double.infinity,
        child: Row(
          children: [
            Container(
              child: Groupe(),
            ),
          ],
        ),
      );
    } else {
      return Groupe();
    }
  }
}

class Groupe extends StatefulWidget {
  const Groupe({super.key});

  @override
  State<Groupe> createState() => _GroupeState();
}

class _GroupeState extends State<Groupe> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Edit",
                  style: TextStyle(
                      color: Color.fromARGB(255, 127, 125, 230),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Sf"),
                ),
                const Spacer(),
                const Text(
                  "Messages",
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontFamily: "Sf"),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(CupertinoIcons.square,
                      color: Color.fromARGB(255, 127, 125, 230)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 80,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Couleur de l'ombre
                                offset: const Offset(3, 3),
                                blurRadius: 10, // Flou de l'ombre
                                spreadRadius: 5, // Étalement de l'ombre
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(99),
                            child: Image.network(
                              "https://lh3.googleusercontent.com/0k6NmC-ScqMVwBsPbChlO660hn3QwrO4QC4J6akBc4dh_hriqDdAAG7mrTMNE7ab_wWnpJyH6dnwRYMAt23TNuDFwQ",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Text(
                          "Priam",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Sf",
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 80,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Couleur de l'ombre
                                offset: const Offset(3, 3),
                                blurRadius: 10, // Flou de l'ombre
                                spreadRadius: 5, // Étalement de l'ombre
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(99),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJe_s3yBHzcnWIRt_sUJ07S7a8L1KiDi-0Ag&usqp=CAU",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Text(
                          "Jessica",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Sf",
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 80,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Couleur de l'ombre
                                offset: const Offset(3, 3),
                                blurRadius: 10, // Flou de l'ombre
                                spreadRadius: 5, // Étalement de l'ombre
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(99),
                            child: Image.network(
                              "http://s3.amazonaws.com/brt.org/tim-cook-3.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "Apple",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Sf",
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 65),
                        height: 1,
                        color: const Color.fromARGB(255, 212, 212, 218),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(99),
                              child: Image.asset(
                                "images/sundae.jpeg",
                                width: 50,
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome",
                                    style: TextStyle(
                                        fontFamily: "Sf",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "description",
                                    style: TextStyle(
                                        fontFamily: "Sf",
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 149, 149, 155),
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(CupertinoIcons.arrow_right),
                              onPressed: () {
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
