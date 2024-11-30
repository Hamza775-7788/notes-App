class NoteModel {
  final String id;
  final String title;
  final String contant;
  final String date;
  final String time;

  NoteModel({
    required this.id,
    required this.title,
    required this.contant,
    required this.date,
    required this.time,
  });

  factory NoteModel.fromJson(json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      contant: json['contant'],
      time: json['time'],
    );
  }

  toJosn() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'contant': contant,
      'time': time,
    };
  }
}
