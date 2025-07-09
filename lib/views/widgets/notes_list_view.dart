import 'package:flutter/material.dart';
import 'package:notes_app_hive/views/widgets/note_item.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: const NoteItem(),
        );
      },
    );
  }
}
