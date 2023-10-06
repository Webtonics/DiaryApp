import 'package:diary/helper/database_helper.dart';
import 'package:diary/screens/note_details.dart';
import 'package:flutter/material.dart';
import '../models/note.dart';
import '../widgets/notelist.dart';
import 'dart:async';

class NoteListView extends StatefulWidget {
  const NoteListView({super.key});

  @override
  State<NoteListView> createState() => _NoteListViewState();
}

class _NoteListViewState extends State<NoteListView> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note>? notelist;
  final notecount = 0;

  @override
  Widget build(BuildContext context) {
    notelist ??= <Note>[];

    void navigator(String appBar) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              const NoteDetailsView(appBartitle: 'ADD NEW NOTE'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notecount,
              itemBuilder: (context, index) {
                return const NoteList(
                  leading: "priorityIcon(priority)",
                  title: "Am loving this",
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              navigator("Add New Note");
            },
            tooltip: "Add New Note",
            child: const Icon(
              Icons.add,
              textDirection: TextDirection.rtl,
            ),
          )
        ],
      ),
    );
  }
}
