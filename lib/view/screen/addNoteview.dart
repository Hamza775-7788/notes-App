import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:note_app/core/shared/CustomTextFormField.dart';
import 'package:note_app/core/shared/buttons.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key, required this.onPressed});
  final Function onPressed;
  static TextEditingController title = TextEditingController();
  static TextEditingController content = TextEditingController();
  static GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Container(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Center(
          child: Column(
            children: [
              const Text(
                'New Note',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: title,
                name: 'Title',
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: content,
                name: 'contant',
                isTitle: false,
              ),
              const SizedBox(height: 10),
              CustomGenralButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {}
                  onPressed(title.text, content.text);
                  title.clear();
                  content.clear();
                  Navigator.pop(context);
                },
                name: "Add Note",
              )
            ],
          ),
        ),
      ),
    );
  }
}
