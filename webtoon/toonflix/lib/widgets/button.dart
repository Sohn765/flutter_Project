import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color txColor;

  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.txColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 50,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: txColor,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
