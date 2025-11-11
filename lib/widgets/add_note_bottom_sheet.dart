import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'custom_bottom.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if(state is AddNoteFailed){
          if (kDebugMode) {
            print(state.errMessage);
          }
        }
        else if(state is AddNoteSuccess){
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading? true : false,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      CustomTextField(hintTxt: 'Title',
                          onSaved: (data) {
                            title = data;
                          }
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        hintTxt: 'Content',
                        maxLines: 5,
                        onSaved: (data) {
                          content = data;
                        },
                      ),
                      SizedBox(height: 100),
                      CustomButton(txt: 'Add',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            var newNote =  NoteModel(
                                title: title!,
                                subtitle: content!,
                                date: DateTime.now().toString(),
                                color: Colors.orangeAccent.shade200.toARGB32(),
                              );
                             context.read<AddNoteCubit>().addNote(newNote);
                            }
                          }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
