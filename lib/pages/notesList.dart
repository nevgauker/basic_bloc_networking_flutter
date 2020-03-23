import 'package:flutter/material.dart';
import '../data/model/note.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;

  NotesList({this.notes});

  //render the currect icon
  Icon renderCompletionIcon(bool completed) {
    if (completed) {
      return Icon(Icons.check);
    } else {
      return Icon(Icons.close);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      itemBuilder: (context, int index) {
        Note note = notes[index];
        return ListTile(
          leading: renderCompletionIcon(note.completed),
          title: Text(note.title),
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: notes.length,
    ));
  }
}
