import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'notesList.dart';
import '../bloc/bloc.dart';
import '../data/model/note.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    final notesBloc = BlocProvider.of<NotesBloc>(context);
    notesBloc.add(GetNotes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocListener<NotesBloc, NotesState>(
          listener: (context, state) {
            if (state is NotesError) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            }
          },
          child: BlocBuilder<NotesBloc, NotesState>(
            builder: (context, state) {
              if (state is NotesInitial) {
                return buildInitialInput(context);
              } else if (state is NotesLoading) {
                return buildLoading();
              } else if (state is NotesLoaded) {
                return buildNotesList(state.notes);
              } else if (state is NotesError) {
                return buildInitialInput(context);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildInitialInput(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        tooltip: 'press me',
        backgroundColor: Colors.blue,
        onPressed: () {
          final notesBloc = BlocProvider.of<NotesBloc>(context);
          notesBloc.add(GetNotes());
        },
      ),
    );
  }

  Widget buildNotesList(List<Note> notes) {
    return NotesList(
      notes: notes,
    );
  }
}
