import 'package:flutter/material.dart';

import 'widgets/edit_note_view.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewBody());
  }
}
