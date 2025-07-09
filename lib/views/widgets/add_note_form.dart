import 'package:flutter/material.dart';
import 'package:notes_app_hive/views/widgets/custom_button.dart';
import 'package:notes_app_hive/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          // > title
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(height: 16),

          // > content
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          // > save button
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
