import 'package:flutter/material.dart';

class CustomIconBar extends StatelessWidget {
  const CustomIconBar({super.key, required this.icon, this.onTap});
  final  IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 47, height: 47,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .04),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Icon(icon, size: 30),
      ),
    );
  }
}