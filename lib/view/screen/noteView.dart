import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/model/noteMpdel.dart';

class NoteView extends StatelessWidget {
  final NoteModel noteModel;
  const NoteView({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(noteModel.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                noteModel.contant,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center
                ,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(noteModel.date, style: const TextStyle(fontSize: 15)),
              Text(noteModel.time, style: const TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
