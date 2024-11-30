import 'dart:convert';

import 'package:note_app/main.dart';
import 'package:note_app/model/noteMpdel.dart';

class LocalDataSourse {
  static String CACHED_NOTES = "CACHED_NOTES";
  static Future<bool> addNote(NoteModel newNot) async {
    try {
      final notes = await getNotes();
      notes.add(newNot);

      saveAllNotes(notes);
      return true;
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }

  static Future<bool> deleteNote(String id) async {
    try {
      List<NoteModel> notes = await getNotes();
      notes.removeWhere((element) => element.id == id);
      saveAllNotes(notes);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateNote(String id, NoteModel newNot) async {
    try {
      List<NoteModel> notes = await getNotes();
      notes = notes.map<NoteModel>((e) => e.id == id ? newNot : e).toList();
      saveAllNotes(notes);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<List<NoteModel>> getNotes() {
    final jsonData = sharedPreferences!.getString(CACHED_NOTES);
    if (jsonData == null) {
      return Future.value([]);
    } else {
      List jsonToList = jsonDecode(jsonData);

      return Future.value(jsonToList
          .map<NoteModel>((jsonNote) => NoteModel.fromJson(jsonNote))
          .toList());
    }
  }

  static saveAllNotes(List<NoteModel> notes) {
    final listToJson = notes.map((e) => e.toJosn()).toList();
    final jsonNotes = jsonEncode(listToJson);
    sharedPreferences!.setString(CACHED_NOTES, jsonNotes);
  }
}
