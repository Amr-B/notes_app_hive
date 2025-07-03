import 'package:flutter/material.dart';
import 'package:notes_app_hive/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app_hive/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        backgroundColor: Colors.grey.shade800,
        child: Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
