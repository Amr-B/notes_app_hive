import 'package:flutter/material.dart';
import 'package:notes_app_hive/views/widgets/custom_app_bar.dart';
import 'package:notes_app_hive/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 40),
          CustomAppBar(),
          SizedBox(height: 24),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
