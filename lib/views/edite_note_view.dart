import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import '../models/note_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_text_field.dart';

class EditeNoteView extends StatefulWidget {
  const EditeNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditeNoteView> createState() => _EditeNoteViewState();
}

class _EditeNoteViewState extends State<EditeNoteView> {
  String? title , content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            SizedBox(height: 35),
            CustomAppbar(icon: Icons.check, title: 'Edit Note',
                onTap: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = content ?? widget.note.subtitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                }
            ),
            SizedBox(height: 30),
            CustomTextField(hintTxt: 'Title', onChanged: (data) {
              title = data;
            }
            ),
            SizedBox(height: 30),
            CustomTextField(
              hintTxt: 'content',
              maxLines: 7,
              onChanged: (data) {
                content = data;
              },
            ),
          ],
        ),
      ),
    );
  }
}
