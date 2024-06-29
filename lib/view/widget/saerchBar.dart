import 'package:flutter/material.dart';
import 'package:note_app/model/noteMpdel.dart';
import 'package:note_app/view/screen/noteView.dart';

class SaerchBar extends SearchDelegate {
  final List<NoteModel> data;

  SaerchBar({required this.data});
  List<NoteModel> filterName = [];

  NoteModel? selectedNote;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      title: Text(selectedNote!.title),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NoteView(noteModel: selectedNote!)));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index].title),
            );
          });
    } else {
      filterName = data
          .where((element) =>
              element.title.contains(query) || element.contant.contains(query))
          .toList();

      return ListView.builder(
          itemCount: filterName.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                query = filterName[index].title;
                selectedNote = filterName[index];
              },
              title: Text(filterName[index].title),
            );
          });
    }
  }
}
