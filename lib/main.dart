import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/notes_bloc.dart';
import 'data/notesRepository.dart';
import 'pages/homepage.dart';
import 'services/networking.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        disabledColor: Colors.black,
      ),
      home: BlocProvider(
        create: (context) => NotesBloc(RealNotesRepository(networking: Networking())),
        child: MyHomePage(title: 'Notes list'),
      ),
    );
  }
}
