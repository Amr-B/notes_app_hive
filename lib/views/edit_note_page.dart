import 'package:flutter/material.dart';
import 'package:notes_app_hive/models/note_model.dart';

import 'widgets/edit_note_view.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewBody(note: note));
  }
}
