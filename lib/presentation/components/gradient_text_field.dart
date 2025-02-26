import 'package:flutter/material.dart';
import 'package:shopnow/resources/app_color.dart';
import 'package:shopnow/resources/app_theme.dart';

class GradientTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const GradientTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Color(0xFF74FBDE), Color(0xFF3C41BF)], // Left & right blue
        ),
      ),
      padding: EdgeInsets.all(1.5), // Adjust border thickness
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white, // Inner background color
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: textStyle.copyWith(fontSize: 12, color: AppColor.grey02),
            border: OutlineInputBorder(
              borderSide: BorderSide.none, // No default border
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: Icon(icon, color: Color(0xFF3C41BF), size: 30,), // Icon on the right
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          ),
        ),
      ),
    );
  }
}
