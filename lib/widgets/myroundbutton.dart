import 'package:flutter/material.dart';

class MyRoundButton extends StatefulWidget {
  const MyRoundButton(
      {super.key,
      required this.label,
      required this.color,
      required this.onTab,
      this.fontsize,
      this.textColor});
  final String label;
  final Color color;
  final Color? textColor;
  final double? fontsize;
  final GestureTapCallback onTab;
  @override
  State<MyRoundButton> createState() => _MyRoundButtonState();
}

class _MyRoundButtonState extends State<MyRoundButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(80, 80),
          backgroundColor: widget.color,
          // padding: EdgeInsets.all(30),
          shape: const CircleBorder()),
      onPressed: widget.onTab,
      child: Text(
        widget.label,
        style: TextStyle(
            fontSize: widget.fontsize ?? 30,
            color: widget.textColor ?? Colors.white),
      ),
    );
  }
}
