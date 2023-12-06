import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> innerWidgets = []; // 안쪽 위젯을 담을 리스트
  double parentHeight = 80.0; // 부모의 초기 높이
  double parentwidth = 300.0; // 부모의 초기 높이

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  child: const Center(
                      child: Text(
                    "adfasdfasd",
                  )),
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
        ElevatedButton(
          onPressed: () {
            // 버튼 클릭 시 안쪽 위젯 추가 및 부모 크기 조절
            setState(() {
              parentHeight += 20.0; // 부모의 높이를 20씩 증가
              parentwidth += 20.0; // 부모의 너비를 20씩 증가
            });
          },
          child: const Text('안쪽 위젯 추가'),
        ),
      ],
    );
  }
}
