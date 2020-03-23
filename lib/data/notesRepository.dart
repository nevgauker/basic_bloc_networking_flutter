import 'model/note.dart';
import 'dart:math';
import 'dart:async';
import '../services/networking.dart';

abstract class NotesRepository {
  Future<List<Note>> fetchNotes();
}

class RealNotesRepository extends NotesRepository {
  final Networking networking;

  RealNotesRepository({this.networking});
  Future<List<Note>> fetchNotes() {
    Future<List<Note>> notes = networking.fetchNotes();
    return notes;
  }
}

class FakeNotesRepository extends NotesRepository {
  Future<List<Note>> fetchNotes() {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        // Simulate some network error
        if (random.nextBool()) {
          throw NetworkError();
        }

        // Return "fetched" notes

        List<Note> notes = [
          Note(id: 8, userId: 9, title: 'bla', completed: true),
          Note(id: 18, userId: 19, title: 'bla bla', completed: false),
          Note(id: 118, userId: 119, title: 'bla bla bla', completed: true),
        ];

        return notes;
      },
    );
  }
}

class NetworkError extends Error {}
