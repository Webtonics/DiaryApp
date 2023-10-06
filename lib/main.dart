import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/note_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diary',
      theme: ThemeData.dark(useMaterial3: true),
      // theme: ThemeData(
      //   primarySwatch: Colors.deepPurple,
      //   useMaterial3: true,
      // ),
      // home: const MyHomePage(title: 'My Diary app'),
      home: const MyDiary(),
    );
  }
}

class MyDiary extends StatelessWidget {
  const MyDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return const NoteListView();
  }
}
