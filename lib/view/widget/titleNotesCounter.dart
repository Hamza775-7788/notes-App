import 'package:flutter/material.dart';
import 'package:note_app/model/noteMpdel.dart';

class TitleNotesCounter extends StatelessWidget {
  const TitleNotesCounter({
    super.key,
    required this.data,
  });

  final List<NoteModel> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: data.isEmpty
          ? const Text(
              ' Note is Empty',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          : data.length == 1
              ? const Text(
                  'one Note',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              : Text(
                  '${data.length} Notes',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
    );
  }
}
