import 'package:flutter/material.dart';

class PopDialogButton extends StatelessWidget {
  const PopDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: 20,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 24,
          height: 24,
          decoration: ShapeDecoration(
            color: const Color(0xFFEFF1F4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Icon(
            Icons.close,
            color: Color(0xFF121212),
            size: 16,
          ),
        ),
      ),
    );
  }
}
