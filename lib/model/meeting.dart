import 'package:cloud_firestore/cloud_firestore.dart';

class Meeting {
  Meeting({this.name = '', this.content = '', this.date});
  String name;
  String content;
  DateTime? date;

  Map<String, dynamic> toFirestore(Meeting data) {
    var sendData = {
      'name': data.name,
      'content' : data.content,
      'date' : data.date
    };

    return sendData;
  }

  Meeting fromFirestore(DocumentSnapshot snapshot) {
    return Meeting(
      name: snapshot['name'],
      content: snapshot['content'],
      date: snapshot['date'].toDate()
    );
  }
}