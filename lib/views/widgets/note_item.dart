import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive/cubits/notes_cubits/notes_cubit.dart';
import 'package:notes_app_hive/models/note_model.dart';
import 'package:notes_app_hive/views/edit_note_page.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _deleteNote() async {
    setState(() => _scale = 0.0);

    await Future.delayed(const Duration(milliseconds: 200));

    await widget.note.delete();

    await Future.delayed(
      const Duration(milliseconds: 100),
    ); // let list update layout

    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNotePage(note: widget.note),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade900,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.note.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      onPressed: _deleteNote, // ✅ This is the correct method
                      icon: Icon(Icons.delete, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Text(
                  widget.note.subTitle,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.note.date,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
