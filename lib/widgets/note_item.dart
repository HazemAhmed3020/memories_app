import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import '../views/edite_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});
 final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditeNoteView(note: noteModel,)));
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 32,
          bottom: 32,
          left: 15,
          right: 8,
        ),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                noteModel.title,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  noteModel.subtitle,
                  style: TextStyle(fontSize: 20, color: Colors.black26),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                    noteModel.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: Icon(Icons.delete, color: Colors.black, size: 35),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(noteModel.date.substring(0 , 10),textAlign: TextAlign.end ,style: TextStyle(color: Colors.black26),),
            ),
          ],
        ),
      ),
    );
  }
}