import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.btnColor,
    required this.textColor,
    required this.onTapEvent,
  });

  final String text;
  final Color btnColor;
  final Color textColor;
  final Function onTapEvent;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      borderRadius: BorderRadius.circular(30),
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      onTap: () {
        widget.onTapEvent();
      },
      child: Container(
        width: 165,
        height: 46,
        decoration: ShapeDecoration(
          color: isHovered ? Colors.black : widget.btnColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
