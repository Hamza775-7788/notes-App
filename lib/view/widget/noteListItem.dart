import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/model/noteMpdel.dart';
import 'package:note_app/view/screen/noteView.dart';

class NotesListItem extends StatelessWidget {
  final NoteModel noteModel;
  final Function onDelete;
  final Function onUpdate;
  const NotesListItem({
    super.key,
    required this.noteModel,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            foregroundColor: AppColors.primary,
            onPressed: (context) {
              onDelete();
            },
            icon: Icons.delete,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            foregroundColor: AppColors.primary,
            onPressed: (context) {
              onUpdate();
            },
            icon: Icons.edit,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.secondary),
        child: ListTile(
            // Navigat to note view
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoteView(noteModel: noteModel)));
            },
            // ignore: prefer_const_constructors
            title: Text(
              noteModel.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      noteModel.contant,
                      maxLines: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(noteModel.date),
                Text(noteModel.time),
              ],
            )),
      ),
    );
  }
}
