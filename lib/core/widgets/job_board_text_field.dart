import 'package:flutter/material.dart';
import 'package:job_board/core/constants/app_color.dart';

class JobBoardTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;

  const JobBoardTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColor.gradient3,
          ),
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.gradient1, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.gradient2, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
