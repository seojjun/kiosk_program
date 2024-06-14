import 'package:flutter/material.dart';

class AddedMenuBoxButton extends StatefulWidget {
  const AddedMenuBoxButton({
    super.key,
    required this.icon,
    required this.hoverColor,
    required this.onTapEvent,
  });

  final IconData icon;
  final Color hoverColor;
  final Function onTapEvent;

  @override
  State<AddedMenuBoxButton> createState() => _AddedMenuBoxButtonState();
}

class _AddedMenuBoxButtonState extends State<AddedMenuBoxButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: IconButton(
        onPressed: () {
          widget.onTapEvent();
        },
        icon: Icon(
          widget.icon,
          color: isHovered ? widget.hoverColor : Colors.black,
        ),
      ),
    );
  }
}
