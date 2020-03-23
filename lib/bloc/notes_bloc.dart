import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:basicblocnetworkingapp/data/notesRepository.dart';
import './bloc.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository notesRepository;

  NotesBloc(this.notesRepository);

  @override
  NotesState get initialState => NotesInitial();

  @override
  Stream<NotesState> mapEventToState(
    NotesEvent event,
  ) async* {
    yield NotesLoading();
    if (event is GetNotes) {
      try {
        final notes = await notesRepository.fetchNotes();

        yield NotesLoaded(notes);
      } on NetworkError {
        yield NotesError("Couldn't fetch weather. Is the device online?");
      }
    }
  }
}
