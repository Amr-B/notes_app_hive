import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 32)),
        Spacer(),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(60),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(child: Icon(icon, size: 28)),
        ),
      ],
    );
  }
}
