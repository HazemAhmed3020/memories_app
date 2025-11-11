import 'package:flutter/material.dart';

import 'custom_icon_bar.dart';
class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.icon, required this.title, this.onTap});
  final IconData icon;
  final String title;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ),
        CustomIconBar(icon: icon, onTap: onTap,),
      ],
    );
  }
}