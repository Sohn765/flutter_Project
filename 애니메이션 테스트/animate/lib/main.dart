import 'package:flutter/material.dart';

void main() => runApp(const AnimatedAlignExampleApp());

class AnimatedAlignExampleApp extends StatelessWidget {
  const AnimatedAlignExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AnimatedAlign Sample')),
        body: const AnimatedAlignExample(),
      ),
    );
  }
}

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

Alignment moveAinmation(double otherX, doubleY) {
  return Alignment(otherX, doubleY);
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // 여기에 새로운 뷰를 열기 위한 코드를 작성할 수 있습니다.
          selected = !selected;
        });
        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            // 여기에 새로운 뷰를 열기 위한 코드를 작성할 수 있습니다.
            selected = !selected;
          });
        });
      },
      child: Center(
        child: Container(
          width: 250.0,
          height: 250.0,
          color: Colors.red,
          child: Column(
            children: [
              Box(selected: selected),
              Box(selected: selected),
              Box(selected: selected),
              Box(selected: selected),
            ],
          ),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.selected,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: selected ? moveAinmation(-1, 1) : moveAinmation(1, -1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      child: Container(
        width: 55,
        height: 55,
        margin: const EdgeInsets.only(left: 5, bottom: 5),
        decoration: const BoxDecoration(color: Colors.green),
        child: Text(
          "1",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: selected
                  ? const Color.fromARGB(255, 255, 2552, 255)
                  : const Color.fromARGB(255, 255, 255, 255),
              fontSize: 40),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
