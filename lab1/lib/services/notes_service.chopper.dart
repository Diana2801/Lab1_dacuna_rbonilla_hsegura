part of 'notes_service.dart';

class _$NotesService extends NotesService{
  _$NotesService([ChopperClient client]){
    if (client == null) return;
    this.client = client;
  }

@override
final definitionType = NotesService;

@override
Future<Response<List<NoteForListing>>> getNotesList(){
  final $url = '/notes';
  final $request = Request('GET', $url, client.baseUrl);
  return client.send<List<NoteForListing>, NoteForListing>($request);
}

@override
Future<Response>Note>> getNote(String noteID){
  final $url = '/notes/$noteID';
  final $request = Request('GET', $url, client.baseUrl);
  return client.send<Note, Note>($request);
}

@override
Future<Response<bool>> createNote(NoteManipulation item){
  final $url = '/notes';
  final $body = item;
  final $request = Request('POST', $url, client.baseUrl, body: $body);
  return client.send<bool, bool>($request);
}

@override
Future<Response<bool>> updateNote(String noteID, NoteManipulation item){
  final $url = '/notes/$noteID';
  final $body = item;
  final $request = Request('PUT', $url, client.baseUrl, body: $body);
  return client.send<bool, bool>($request);
}
@override
Future<Response<bool>> deleteNote(String noteID){
  final $url = '/notes/$noteID';
  final $request = Request('DELETE', $url, client.baseUrl);
  return client.send<bool, bool>($request);
}
}

