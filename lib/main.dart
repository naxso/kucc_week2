import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kucc/firebase_options.dart';
import 'package:kucc/model/meeting.dart';
import 'package:kucc/services/database_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('CalBack',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40
            ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right:8),
              child: IconButton(onPressed: (){
                print('Menu!');
              }, icon: Icon(Icons.menu))
            ),
          )
        ],
      ),
      body: 
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: DatabaseServices().readMeetingDB(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Meeting snapshotMeeting = snapshot.data as Meeting;

                  return Container(
                    padding: EdgeInsets.all(8),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.redAccent
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshotMeeting.content),
                            Text(snapshotMeeting.date.toString())
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () async{
                            Map<String, dynamic> updateData = {
                              'content' : 'The content has been updated'
                            };

                            DatabaseServices().updateMeetingDB('meeting1', updateData);
                            setState(() {
                              
                            });
                          },
                          child: Icon(Icons.add)
                        )
                      ],
                    ),
                  );
                }

                else {
                  print('No data returned from DB!!');
                  return Container();
                }
              },
            ),

            Container(
              width: 50,
              height: 50,
              child: InkWell(
                onTap: () async {
                  var firstMeeting = Meeting(
                    name: 'KUCC',
                    content: 'KUCC 특강 2주차',
                    date: DateTime.now()
                  );
          
                  DatabaseServices().createMeetingDB(firstMeeting);
                },
                child: Icon(
                  Icons.plus_one,
                  size: 50,
                  color: Colors.black,
                )
              )
            ),

            InkWell(
              onTap: () {
                DatabaseServices().deleteMeetingDB();
              },
              child: Icon(
                Icons.exposure_minus_1,
                size: 50
              )
            )
          ],
        ),
      )
    );
  }
}
