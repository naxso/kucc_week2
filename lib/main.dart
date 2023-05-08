import 'package:flutter/material.dart';

void main() {
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
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right:40),
              child: Text('회원가입',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),
              )
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
            Row(
              children: [
                Container( 
                  child: Text('2023-05-08')
                ),
                SizedBox(width: 10,),
                Container(
                  child: Text('나의 일정1'),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Container( 
                  child: Text('2023-05-08')
                ),
                SizedBox(width: 10,),
                Container(
                  child: Text('나의 일정1'),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Container( 
                  child: Text('2023-05-08')
                ),
                SizedBox(width: 10,),
                Container(
                  child: Text('나의 일정1'),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(_counter.toString()),
            IconButton(
              onPressed: (){
                setState(() {
                  _counter++ ;
                });  
              }, 
              icon: Icon(Icons.plus_one)
            ),
            IconButton(
              onPressed: (){
                setState(() {
                  _counter-- ;
                });  
              }, 
              icon: Icon(Icons.abc)
            )
          ],
        ),
      )
    );
  }
}
