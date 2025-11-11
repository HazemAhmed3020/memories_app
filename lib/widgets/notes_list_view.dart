import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_item.dart';
class NotesListView extends StatelessWidget {
  const NotesListView({super.key, required this.noteList});
  final List<NoteModel> noteList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index) {
          return NoteItem(noteModel: noteList[index],);
        },
      ),
    );
  }
}