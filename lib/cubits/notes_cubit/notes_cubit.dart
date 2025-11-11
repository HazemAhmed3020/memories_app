import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  void fetchAllNotes() {
    var noteBox =  Hive.box<NoteModel>(kNoteBox);
    List<NoteModel> noteList =  noteBox.values.toList();
    emit(NotesSuccess(noteList));
  }
}
