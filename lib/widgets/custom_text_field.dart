import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintTxt, this.maxLines = 1, this.onSaved, this.onChanged,});
  final String hintTxt;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return 'This field is required';
        }
        else {
          return null;
        }
      },
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintTxt,
        hintStyle: TextStyle( fontSize: 18, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white54,
            width: 5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white54,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        contentPadding: EdgeInsets.all(20),
      ),
    );
  }
}