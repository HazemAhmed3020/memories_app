import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 const CustomButton({super.key, required this.txt , required this.onTap});
  final String txt;
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF60EEE2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          txt,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}