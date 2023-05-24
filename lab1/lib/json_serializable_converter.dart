import 'package:chopper/chopper.dart';

import 'models/resource_error.dart';

typedef T JsonFactory<T>(Map<String, dynamic>json);

class JsonSerializableConverter extends JsonConverter{
  final Map<Type, JsonFactory> factories;

  JsonSerializableConverter(this.factories);

  T _decodeMap<T>(Map<String, dynamic> values, {Type type}){
    var jsonFactory;
    if(T == dynamic){
      jsonFactory = factories[type];
    }else{
      jsonFactory = factories[T];
    }
    if(jsonFactory == null || jsonFactory is! JsonFactory<T>){
      return null;
    }
    return jsonFactory(values);
  }

  List<T> _decodeList<T>(List values)=>
    values.where((v)=> v != null).map<T>((v)=> _decode<T>(v)).toList();
  
  dynamic _decode<T>(entity, {Type type}){
    if (entity is Iterable) return _decodeList<T>(entity);
    if (entity is Map) return _decodeMap<T>(entity, type:type);

    return entity;
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response, {Type type}){
    final jsonRes = super.convertResponse(response);
    return jsonRes.replace<ResultType>(body: _decode<Item>(jsonRes.body, type: type));
  }
  @override
  Request converterRequest(Request request) => super.convertRequest(request);

  Response convertError<ResultType, Item>(Response response){
    final jsonRes = super.convertError(response);

    return jsonRes.replace<ResourceError>(
      body: ResourceError.fromJsonFactory(jsonRes.body),
    );
  }
}