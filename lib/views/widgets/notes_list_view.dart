import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive/cubits/notes_cubits/notes_cubit.dart';
import 'package:notes_app_hive/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccess) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: NoteItem(
                  key: ValueKey(note.key), // 👈 FIX HERE
                  note: note,
                ),
              );
            },
          );
        } else if (state is NotesFailure) {
          return Center(child: Text('Error: ${state.errMessage}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
