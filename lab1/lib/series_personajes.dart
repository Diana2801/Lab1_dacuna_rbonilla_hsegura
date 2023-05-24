import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*Future<void> obtenerDatosDesdeAPI() async {
  final url = Uri.parse('https://graphql.anilist.co');

  // Define la consulta GraphQL
  final query = '''
    query {
      Media(id: 21894, type: ANIME) {
        characters {
          nodes {
            name {
              full
            }
            age
            gender
            description
            image {
              medium
            }
            siteUrl
          }
        }
      }
    }
  ''';

  try {
    final response = await http.post(
      url,
      body: {'query': query},
    );

    if (response.statusCode == 200) {
      // La solicitud fue exitosa, puedes manejar la respuesta aquí
      final data = jsonDecode(response.body);
      // Procesa los datos y realiza las acciones necesarias
      // ...

    } else {
      // La solicitud falló, maneja el error aquí
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (error) {
    // Maneja cualquier excepción que ocurra durante la solicitud
    print('Error en la solicitud: $error');
  }
}*/


Future<void> obtenerPersonajes(int serieId) async {
  final url = Uri.parse('https://graphql.anilist.co');
  
  final query = '''
    query (\$id: Int) {
      Media (id: \$id, type: ANIME) {
        characters {
          nodes {
            name {
              full
            }
            age
            gender
            description
            image {
              medium
            }
            siteUrl
          }
        }
      }
    }
  ''';
  
  final variables = {
    'id': serieId,
  };
  
  final headers = {
    'Content-Type': 'application/json',
  };
  
  final body = json.encode({
    'query': query,
    'variables': variables,
  });
  
  try {
    final response = await http.post(url, headers: headers, body: body);
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      // Procesa los datos de los personajes aquí
      final personajes = data['data']['Media']['characters']['nodes'];
      // ...
      
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (error) {
    print('Error en la solicitud: $error');
  }
}

Future<void> obtenerSeriesPorGenero(String genero) async {
  final url = Uri.parse('https://graphql.anilist.co');
  
  final query = '''
    query (\$genre: String) {
      Page {
        media (type: ANIME, genre: \$genre) {
          title {
            romaji
          }
          description
          episodes
          averageScore
          siteUrl
        }
      }
    }
  ''';
  
  final variables = {
    'genre': genero,
  };
  
  final headers = {
    'Content-Type': 'application/json',
  };
  
  final body = json.encode({
    'query': query,
    'variables': variables,
  });
  
  try {
    final response = await http.post(url, headers: headers, body: body);
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      // Procesa los datos de las series aquí
      final series = data['data']['Page']['media'];
      // ...
      
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (error) {
    print('Error en la solicitud: $error');
  }
}
 
/*FutureBuilder(
  future: obtenerPersonajes(serieId), // Llama a la función que obtiene los datos de los personajes
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // Muestra un indicador de carga mientras se obtienen los datos
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}'); // Muestra un mensaje de error si la solicitud falla
    } else {
      final personajes = snapshot.data; // Obtén los datos de los personajes de la serie

      // Muestra los datos en un ListView.builder
      return ListView.builder(
        itemCount: personajes.length,
        itemBuilder: (context, index) {
          final personaje = personajes[index];

          // Muestra la vista simplificada del personaje (solo 3 datos)
          return ListTile(
            title: Text(personaje['name']['full']),
            subtitle: Text(personaje['description']),
            leading: Image.network(personaje['image']['medium']),
          );
        },
      );
    }
  },
);*/




