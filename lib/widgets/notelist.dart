import 'package:diary/helper/database_helper.dart';
import 'package:diary/screens/note_details.dart';
import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key, required this.leading, required this.title});

  final String leading;
  final String title;

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note>? notelist;
  //function to get the id

  //Function to delete note
  void deleteNote(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar;
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    const snackBar = SnackBar(
      content: Text("Note Deleted Successfully"),
    );
    Scaffold.of(context).showBottomSheet((context) => snackBar);
  }

  @override
  Widget build(BuildContext context) {
    void navigator(String appBar) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NoteDetailsView(
            appBartitle: 'EDIT ${widget.title}',
          ),
        ),
      );
    }

    return Card(
      elevation: 2,
      child: ListTile(
        leading: const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 174, 172, 172),
            child: Icon(Icons.arrow_right)),
        title: Text(widget.title),
        subtitle: const Text("Am really loving the test so far so good"),
        trailing: GestureDetector(
          child: const Icon(Icons.delete),
          onTap: () => deleteNote,
        ),
        onTap: () {
          // const titles = "Edit Note";
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => const NoteDetailsView( title: titles,),
          // ));
          navigator("Edit ${widget.title}");
        },
      ),
    );
  }

  //funtion to return the priority color
  Color priorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.yellow;
      default:
        return Colors.yellow;
    }
  }

  //function to return the priority icon
  IconData priorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icons.arrow_right;
      case 2:
        return Icons.arrow_right_alt_outlined;
      default:
        return Icons.arrow_right;
    }
  }
}
