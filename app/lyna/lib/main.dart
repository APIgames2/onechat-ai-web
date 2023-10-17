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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: NavBar()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Home",
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    var index = 0;
    return Column(
      children: [
        Container(
          height: 60,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFD2D2D2)))),
          child: Center(
              child: Stack(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Center(
                        child: GestureDetector(
                      child: Image.asset("assets/icons/home.png"),
                    )),
                  ),
                  const Spacer(),
                  Container(
                    color: Colors.orange,
                    width: 240,
                    child: Center(
                      child: Text("hello"),
                    ),
                  )
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Center(
                          child: TextButton(
                        onPressed: () {
                        },
                        child: const Text(
                          "Lyna",
                          style: TextStyle(
                              color: Color(0xff0013BA),
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      )),
                    ),
                    const SizedBox(
                      width: 270,
                      child: Center(
                        child: Text(
                          "colllège george mandel",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          "élève",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
        PagesController(index)
      ],
    );
  }
}

Widget PagesController(index) {
  switch (index) {
    default:
      return const HomePage();
  }
}
