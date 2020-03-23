import 'package:dio/dio.dart';
import '../data/model/note.dart';

class Networking {
  Future<List<Note>> fetchNotes() async {
    try {
      Response response = await Dio()
          .get("https://jsonplaceholder.typicode.com/todos?userId=1");
      List collection = response.data;
      List<Note> _notes =
          collection.map((json) => Note.fromJson(json)).toList();
      return Future.value(_notes);
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }
}
