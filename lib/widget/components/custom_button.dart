import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget widget;
  final double minHeight;
  final double minWidth;
  final double maxHeight;
  final double maxWidth;
  final VoidCallback onTap;

  CustomButton({
    this.widget,
    this.minHeight,
    this.minWidth,
    this.maxHeight,
    this.maxWidth,
    this.onTap,
  });
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          isTapped = false;
        });
        widget.onTap();
      },
      child: Container(
        height: isTapped ? widget.minHeight : widget.maxHeight,
        width: isTapped ? widget.minWidth : widget.maxWidth,
        child: widget,
      ),
    );
  }
}
