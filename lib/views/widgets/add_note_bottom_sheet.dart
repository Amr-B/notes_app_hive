import 'package:flutter/material.dart';
import 'package:notes_app_hive/views/widgets/custom_button.dart';
import 'package:notes_app_hive/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(hint: 'Title'),
            SizedBox(height: 16),
            CustomTextField(hint: 'Content', maxLines: 5),
            SizedBox(height: 16),
            CustomButton(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
