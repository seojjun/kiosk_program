import 'package:flutter/material.dart';

class AddedMenuDeleteButton extends StatefulWidget {
  const AddedMenuDeleteButton({
    super.key,
    required this.onTapEvent,
  });

  final Function onTapEvent;
  @override
  State<AddedMenuDeleteButton> createState() => _AddedMenuDeleteButtonState();
}

class _AddedMenuDeleteButtonState extends State<AddedMenuDeleteButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 0,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        onTap: () {
          widget.onTapEvent();
        },
        child: Container(
          width: 20,
          height: 20,
          decoration: ShapeDecoration(
            color: isHovered ? Colors.black : Colors.red,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
              ),
            ),
          ),
          child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}
