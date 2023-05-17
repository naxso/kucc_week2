import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kucc/model/meeting.dart';

class DatabaseServices{
  final meetingCollection = FirebaseFirestore.instance.collection('meetingCollection');

  void createInitialMeetingDB(Meeting meeting) async {
    Map<String, dynamic> mappedData = meeting.toFirestore(meeting);
    await meetingCollection
      .doc('meeting1')
      .set(mappedData);
    print("DB meeting create complete!");
  }

  void createMeetingDB(Meeting meeting) async {
    Map<String, dynamic> mappedData = meeting.toFirestore(meeting);
    await meetingCollection
      .add(mappedData);
    print("DB meeting create complete!");
  }

  Future<Meeting> readMeetingDB() async {
    Meeting requestedDocument = Meeting();
    
    await meetingCollection
      .get()
      .then((snapshot) {
        requestedDocument = Meeting().fromFirestore(snapshot.docs.first);
        return requestedDocument;
      });

    return requestedDocument;
  }

  void updateMeetingDB(String id, Map<String, dynamic> data) async {
    await meetingCollection
      .doc(id)
      .update(data);
  }

  void deleteMeetingDB() async {
    await meetingCollection
      .doc()
      .delete();
  }


}