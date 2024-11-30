import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:note_app/core/shared/CustomTextFormField.dart';
import 'package:note_app/core/shared/buttons.dart';
import 'package:note_app/data/local_data_sourse.dart';
import 'package:note_app/model/noteMpdel.dart';

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
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    NoteModel noteModel = NoteModel(
                        id: DateTime.now().toString(),
                        title: title.text,
                        contant: content.text,
                        date:
                            '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
                        time:
                            '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}');
                    if (await LocalDataSourse.addNote(noteModel)) {
                      title.clear();
                      content.clear();
                      onPressed;
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Success"),
                        backgroundColor: Colors.green,
                      ));
                    } else {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Failed"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  }
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
