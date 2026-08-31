import 'dart:convert';
import 'note.dart';
import 'note_storage.dart';
import 'note_http.dart';

Future main() async {

  // ------------------------------------------------------------------------------- //
  // GET: Obtiene las notas desde la API.
  // ------------------------------------------------------------------------------- //

  var response = await get();
  List<dynamic> remoteData = jsonDecode(response);
  
  List<Map<String, dynamic>> noteMaps = [];

  for(var noteData in remoteData){
    Note note = Note(
      noteData["id"],
      noteData["title"],
      noteData["body"],
      DateTime.now(),  
    );

    // Convierte cada objeto Note en un Map para poder serializarlo a JSON.
    Map<String, dynamic> noteMap = note.toJson();

    noteMaps.add(noteMap);
  }

  // Convierte la lista de Maps en un String con formato JSON.
  String notesJson = jsonEncode(noteMaps);

  // Guarda el JSON en storage/notes.json.
  await writeFile(notesJson); 


  // ------------------------------------------------------------------------------- //
  // POST: Envía las notas guardadas localmente a la API.
  // ------------------------------------------------------------------------------- //


  // Lee el JSON guardado localmente para enviarlo a la API.
  String jsonString = await readFile();

  // Envía las notas mediante una solicitud POST y obtiene el resultado, luego uestra el resultado para comprobar que fue exitosa
  var result = await post(jsonString);
  print(result);
}