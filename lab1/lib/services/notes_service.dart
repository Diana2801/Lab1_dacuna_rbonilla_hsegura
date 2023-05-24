// import 'package:flutter/gestures.dart';
// import 'package:lab1/models/api_response.dart';
import 'package:lab1/models/note.dart';
import 'package:lab1/models/note_for_listing.dart';
// import 'package:http/http.dart as http';
import 'package:lab1/models/note_insert.dart';
import 'package:chopper/chopper.dart';

part 'notes_service.chopper.dart';

@ChopperApi(baseUrl: "/notes")
abstract class NotesService extends ChopperService {
  
  static const headers = {
    'apiKey': 'e5245278.ed86-4196-81d6-cdf608b02623',
    'Content-Type': 'application/json'
  };

  static NotesService create([ChopperClient client]) => _$NotesService(client);

  @Get()
  Future<Response<List<NoteForListing>>> getNotesList(); 
  // {
  //   return http.get(API + '/notes', headers: headers).then((data) {
  //     if (data.statusCode == 200) {
  //       final jsonData = json.decode(data.body);
  //       return APIResponse<List<NoteForListing>>(
  //           data: Note.fromJson(jsonData, error: false, errorMessage: ''),
  //           error: false,
  //           errorMessage: '');
  //     }
  //     return APIResponse<List<NoteForListing>>(
  //         data:
  //             Note.fromJson({}, error: true, errorMessage: 'An error occured'),
  //         error: true,
  //         errorMessage: 'An error occured');
  //   }).catchError((_) => APIResponse<List<NoteForListing>>(
  //       data: Note.fromJson({}, error: true, errorMessage: 'An error occured'),
  //       error: true,
  //       errorMessage: 'An error occured'));
  // }

//API/notes/123456
  @Get(path: '{noteID}')
  Future<Response<Note>> getNote(@Path() String noteID) ;
  // {
  //   return http.get(API + '/notes/' + noteID, headers: headers).then((data) {
  //     if (data.statusCode == 200) {
  //       final jsonData = json.decode(data.body);
  //       return APIResponse<Note>(
  //           data: Note.fromJson(jsonData, error: false, errorMessage: ''),
  //           error: false,
  //           errorMessage: '');
  //     }
  //     return APIResponse<Note>(
  //         data:
  //             Note.fromJson({}, error: true, errorMessage: 'An error occured'),
  //         error: true,
  //         errorMessage: 'An error occured');
  //   }).catchError((_) => APIResponse<Note>(
  //       data: Note.fromJson({}, error: true, errorMessage: 'An error occured'),
  //       error: true,
  //       errorMessage: 'An error occured'));
  // }

  @Post()
  Future<Response<Note>> createNote(@Body() NoteManipulation item) ;

  @Put(path: '{noteID, item}')
  Future<Response<List<NoteForListing>>> updateNote(
      @Path() String noteID, @Body() NoteManipulation item);
  //     {
  //   return http
  //       .put(API + '/notes' + noteID,
  //           headers: headers, body: json.encode(item.toJson()))
  //       .then((data) {
  //     if (data.statusCode == 204) {}
  //     return APIResponse<bool>(data: true, error: false, errorMessage: '');
  //   }).catchError((_) => APIResponse<bool>(
  //           data: false, error: true, errorMessage: 'An error occured'));
  // }
  @Delete(path: '{noteID}')
  Future<Response<List<NoteForListing>>> deleteNote(
      @Path() String noteID);
  //      {
  //   return http
  //       .delete(API + '/notes' + noteID,
  //           headers: headers)
  //       .then((data) {
  //     if (data.statusCode == 204) {}
  //     return APIResponse<bool>(data: true, error: false, errorMessage: '');
  //   }).catchError((_) => APIResponse<bool>(
  //           data: false, error: true, errorMessage: 'An error occured'));
  // }
}
