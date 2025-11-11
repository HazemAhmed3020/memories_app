import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_text_field.dart';
class EditeNoteView extends StatelessWidget {
  const EditeNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            SizedBox(height: 35),
            CustomAppbar(icon: Icons.check, title: 'Edit Note',),
            SizedBox(height: 30,),
            CustomTextField(hintTxt: 'Title'),
            SizedBox(height: 30,),
            CustomTextField(hintTxt: 'content', maxLines: 7,),
          ],
        ),

      ),
    );
  }
}