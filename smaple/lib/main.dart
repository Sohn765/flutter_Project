import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  double parentwidth = 300.0; // 부모의 초기 높이
  double parentHeight = 80.0; // 부모의 초기 높이
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              width: parentwidth,
              height: parentHeight,
              child: Column(
                children: [
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 15,
                        color: Colors.lightBlue,
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.amberAccent,
                    ),
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 15,
                        color: Colors.lightBlue,
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  parentHeight += 20.0; // 부모의 높이를 20씩 증가
                  parentwidth += 20.0; // 부모의 높이를 20씩 증가
                });
              },
              child: const Text('크기 키우기'),
            ),
          ],
        ),
      ),
    );
  }
}
