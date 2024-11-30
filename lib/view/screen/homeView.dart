import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/core/constant/colors.dart';
import 'package:note_app/data/local_data_sourse.dart';

import 'package:note_app/model/noteMpdel.dart';

import 'package:note_app/view/screen/editView.dart';
import 'package:note_app/view/widget/floatButton.dart';
import 'package:note_app/view/widget/noteListItem.dart';
import 'package:note_app/view/widget/saerchBar.dart';
import 'package:note_app/view/widget/titleNotesCounter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<NoteModel> data = [];
  // add new note to list notes
// delete note form list
  void deleteNote(NoteModel noteModel) async {
    if (await LocalDataSourse.deleteNote(noteModel.id)) {
      getData();
      setState(() {});
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

  // update Note
  void updateNote(NoteModel note, String newTitle, String newContent) async {
    final NoteModel newNote = NoteModel(
        id: note.id,
        title: newTitle,
        contant: newContent,
        date: note.date,
        time: note.time);
    if (await LocalDataSourse.updateNote(note.id, newNote)) {
      getData();
      setState(() {});
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

  getData() async {
    data = await LocalDataSourse.getNotes();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: PopupMenuButton(
            itemBuilder: (context) {
              return [];
            },
          ),
          centerTitle: true,
          backgroundColor: AppColors.background,
          title: const Text("Note App "),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SaerchBar(data: data));
                },
                icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: data.isEmpty
            ? Center(child: Lottie.asset('asset/lottie/1.json', height: 200))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleNotesCounter(data: data),
                  Expanded(
                      child: RefreshIndicator(
                          child: ListView.builder(
                              padding: const EdgeInsets.all(15),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final note = data[index];
                                return NotesListItem(
                                  noteModel: note,
                                  onDelete: () {
                                    deleteNote(note);
                                  },
                                  onUpdate: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return EditNote(
                                              onPressed: (title, content) {
                                                updateNote(
                                                    note, title, content);
                                              },
                                              note: note);
                                        });
                                  },
                                );
                              }),
                          onRefresh: () {
                            return getData();
                          })),
                ],
              ),
        floatingActionButton: FloatButton(
          onAdd: () {
            getData();
          },
        ));
  }
}
