import 'package:flutter/material.dart';
import 'package:note_app/view/screen/addNoteview.dart';

class FloatButton extends StatelessWidget {
  final Function onAdd;
  const FloatButton({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => AddNoteView(
                  onPressed: (title, content) {
                    onAdd(title, content);
                  },
                ));
      },
      child: const Icon(Icons.add),
    );
  }
}
