import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive/cubits/notes_cubits/notes_cubit.dart';
import 'package:notes_app_hive/models/note_model.dart';
import 'package:notes_app_hive/views/widgets/custom_app_bar.dart';

import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Notes',
            icon: Icons.check,
          ),
          const SizedBox(height: 50),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            onSaved: (value) {
              title = value;
            },
            hint: widget.note.title,
          ),
          const SizedBox(height: 16),

          // > content
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            onSaved: (value) {
              content = value;
            },
            hint: widget.note.subTitle,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
