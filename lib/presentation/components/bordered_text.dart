import 'package:flutter/material.dart';

class BorderedText extends StatelessWidget {
  final String text;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  const BorderedText({
    super.key,
    required this.text,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
    this.borderRadius = 8.0,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.black),
    this.padding = const EdgeInsets.only(top: 1, bottom: 1, left: 8, right: 4),
    this.icon = Icons.arrow_forward, // Default arrow icon
    this.iconColor = Colors.black,
    this.iconSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and icon
        children: [
          Text(text, style: textStyle),
          Icon(icon, color: iconColor, size: iconSize), // Arrow icon on the right
        ],
      ),
    );
  }
}
