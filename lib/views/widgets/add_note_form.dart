// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_hive/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_hive/models/note_model.dart';
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
          ColorsListView(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();

                    var formatterCurrentDate = DateFormat.yMEd().format(
                      currentDate,
                    );
                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formatterCurrentDate,
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircleAvatar(radius: 23, backgroundColor: color),
          )
        : CircleAvatar(radius: 25, backgroundColor: color);
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  final List<Color> colors = [
    Color(0xffAC3931),
    Color(0xffE5D352),
    Color(0xffD9E76C),
    Color(0xff537D8D),
    Color(0xff482C3D),
    Color(0xffFF6F61),
    Color(0xff6B5B95),
    Color(0xff88B04B),
    Color(0xffF7CAC9),
    Color(0xff92A8D1),
    Color(0xff955251),
    Color(0xffB565A7),
    Color(0xff009B77),
    Color(0xffDD4124),
    Color(0xffD65076),
    Color(0xff45B8AC),
    Color(0xffEFC050),
    Color(0xff5B5EA6),
    Color(0xff9B2335),
    Color(0xffDFCFBE),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
