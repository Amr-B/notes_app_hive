import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_hive/views/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFalure) {
            print('Falure faild faild ${state.errMessage}');
          }

          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },

        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
