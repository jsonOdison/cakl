import 'package:flutter/material.dart';

class MyRectangleButton extends StatefulWidget {
  const MyRectangleButton(
      {super.key,
      required this.label,
      required this.color,
      this.fontsize,
      this.textColor});
  final String label;
  final Color color;
  final Color? textColor;
  final double? fontsize;
  @override
  State<MyRectangleButton> createState() => _MyRectangleButtonState();
}

class _MyRectangleButtonState extends State<MyRectangleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 80),
          backgroundColor: widget.color,
          // padding: EdgeInsets.all(30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: () {},
      child: Text(
        widget.label,
        style: TextStyle(
            fontSize: widget.fontsize ?? 30,
            color: widget.textColor ?? Colors.white),
      ),
    );
  }
}
