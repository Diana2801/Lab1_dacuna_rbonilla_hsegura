import 'package:json_annotation/json_annotation.dart';

part 'note_for_listing.g.dart';

@JsonSerializable()
class NoteForListing{
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  NoteForListing({required this.noteID,required this.noteTitle,required this.createDateTime,required this.latestEditDateTime});
  static fromJson(Map<String, dynamic> item) => _$NoteManipulationFromJson(item);
  
}