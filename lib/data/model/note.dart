import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note extends Equatable {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Note({this.id, this.userId, this.title, this.completed});

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  @override
  List<Object> get props => [id, userId, title, completed];
}
