import 'package:flutter/material.dart';
import 'package:kiosk_program/utils/functions.dart';

class MenuBox extends StatefulWidget {
  const MenuBox({
    super.key,
    required this.menuCategory,
    required this.menuName,
    required this.menuPrice,
    required this.width,
    required this.onTapShowMenuInfoDialog,
  });

  final String menuCategory;
  final String menuName;
  final int menuPrice;
  final double width;
  final Function onTapShowMenuInfoDialog;

  @override
  State<MenuBox> createState() => _MenuBoxState();
}

class _MenuBoxState extends State<MenuBox> {
  bool isHovered = false;
  late String menuImagePath =
      'assets/menu/${widget.menuCategory}/${widget.menuName}.jpg';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      borderRadius: BorderRadius.circular(15),
      onHover: (value) {
        setState(() => isHovered = value);
      },
      onTap: () {
        widget.onTapShowMenuInfoDialog(
          menuImagePath,
          widget.menuName,
          widget.menuPrice,
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: widget.width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                image: DecorationImage(
                  colorFilter: isHovered
                      ? const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.multiply,
                        )
                      : null,
                  image: AssetImage(
                    menuImagePath,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: isHovered
                  ? const Icon(
                      Icons.add_shopping_cart,
                      color: Color.fromARGB(255, 193, 255, 249),
                      size: 75,
                    )
                  : null,
            ),
          ),
          Container(
            width: widget.width,
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Text(widget.menuName),
                Text(
                  numberFormatting(widget.menuPrice),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
