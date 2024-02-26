import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool obscureText;

  CustomTextField({this.hintText, this.icon, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            prefix: SizedBox(width: 8.0),
            suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
            contentPadding: EdgeInsets.symmetric(vertical: 14.0),
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double elevation;
  final double borderRadius;

  const CustomElevatedButton({
    required this.onPressed,
    required this.child,
    this.elevation = 5.0,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 50),
        primary: const Color(0xFF1B1E69),
        onPrimary: Colors.grey,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}

class CustomElevatedButtonWithIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final dynamic icon; // Thay đổi kiểu dữ liệu của icon thành dynamic
  final Widget label;
  final Color primaryColor;
  final Color onPrimaryColor;
  final double minWidth;
  final double height;
  final double borderRadius;

  const CustomElevatedButtonWithIcon({
    required this.onPressed,
    required this.icon,
    required this.label,
    this.primaryColor = const Color(0xFFF3F3F3),
    this.onPrimaryColor = Colors.black,
    this.minWidth = 300,
    this.height = 40,
    this.borderRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(minWidth, height),
        primary: primaryColor,
        onPrimary: onPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon is IconData // Kiểm tra xem icon có phải là IconData không
              ? Icon(icon as IconData) // Nếu là IconData, tạo một Icon từ nó
              : icon, // Nếu không phải IconData, giữ nguyên widget icon
          SizedBox(width: 8),
          label,
        ],
      ),
    );
  }
}