import 'package:flutter/material.dart';
import 'package:notes_app_hive/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required bool isLoading});

  final void Function()? onTap;
  final bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: const CircularProgressIndicator(color: Colors.black),
                )
              : const Text(
                  'Save',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
