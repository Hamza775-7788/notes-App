import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:note_app/core/shared/CustomTextFormField.dart';
import 'package:note_app/core/shared/buttons.dart';
import 'package:note_app/model/noteMpdel.dart';

class EditNote extends StatefulWidget {
  EditNote({super.key, required this.onPressed, required this.note});
  final NoteModel note;
  final Function onPressed;
  static GlobalKey<FormState> formkey = GlobalKey();

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title = TextEditingController();

  TextEditingController content = TextEditingController();
  @override
  void initState() {
    title.text = widget.note.title;
    content.text = widget.note.contant;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: EditNote.formkey,
      child: Container(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Update Note',
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
                  if (EditNote.formkey.currentState!.validate()) {}
                  widget.onPressed(title.text, content.text);
                  title.clear();
                  content.clear();
                  Navigator.pop(context);
                },
                name: "Update",
              )
            ],
          ),
        ),
      ),
    );
  }
}
