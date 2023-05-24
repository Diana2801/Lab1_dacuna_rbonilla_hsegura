import 'package:flutter/gestures.dart';
import 'package:lab1/models/api_response.dart';
import 'package:lab1/models/note.dart';
import 'package:lab1/models/note_for_listing.dart';
import 'package:http/http.dart as http';
import 'package:lab1/models/note_insert.dart';
import 'package:chopper/chopper.dart';

part  'notes_service.chopper.dart';

@ChopperApi(baseUrl: "/notes")
abstract class NotesService extends ChopperService{
  static const API = 'https://tq-notesapi-jkrgrdggbq-el.a.run.app';
  static const Header = {
    'apiKey': 'e5245278.ed86-4196-81d6-cdf608b02623',
    'Content-Type': 'application/json'
  };
}

static NotesService create([ChopperClient client]) => _$NotesService(client);

@Get()
Future<Response<List<NoteForListing>>> getNotesList(){
  return http.get(API + '/notes',headers: headers).then((data){
    if (data.statusCode == 200){
    }
    return APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured');
  })
  .catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured'));
}

//API/notes/123456
@Get(path: '{noteID}')
Future<Response<Note>> getNote(@Path() String noteID){
  return http.get(API + '/notes/' + noteID, headers: headers).then((data){
    if (data.statusCode == 200){
      final jsonData = json.decode(data.body);
      return APIResponse<Note>(data: Note.fromJson(jsonData));
    }
    return APIResponse<Note>(error: true, errorMessage: 'An error occured');
  })
  .catchError((_) => APIResponse<Note>(error: true, errorMessage: 'An error occured'));
}