part of 'note_insert.dart';

NoteManipulation _$NoteManipulationFromJson(Map<String, dynamic> json){
  return NoteManipulation(
    noteTitle: json['noteTitle'] as String, 
    noteContent: json['noteContent'] as String,
    );
}
Map<String, dynamic>_$NoteManipulationToJson(NoteManipulation instance)=>
<String, dynamic>{
  'noteTitle':instance.noteTitle,
  'noteContenr':instance.noteContent,
};