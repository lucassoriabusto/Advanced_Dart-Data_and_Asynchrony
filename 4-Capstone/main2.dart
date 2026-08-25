import "dart:convert";
import "note.dart";
import "note_storage.dart";
import "note_io.dart";

void main() async {

  // Lee el JSON guardado y lo convierte nuevamente en una lista de datos.
  String jsonString = await readFile();
  List<dynamic> loadedNotes = jsonDecode(jsonString);

  // Busca el ID más alto entre las notas existentes.
  int highestId = 0;

  for(var i in loadedNotes){
    if(i["id"] >= highestId){
      
      highestId = i["id"];
    }
  }

  // Genera el siguiente ID disponible.
  int newID = highestId + 1;

  // Solicita al usuario el título y contenido de la nueva nota.
  Map<String, dynamic> noteData = prompt();

  // Crea una nueva Note con los datos proporcionados, el ID y la fecha actual.
  Note newNote = Note(
    newID,
    noteData["title"],
    noteData["body"],
    DateTime.now(),
  );

  // Convierte la Note en un Map y la agrega a la lista de notas existentes.
  Map<String, dynamic> noteMap = newNote.toJson();
  loadedNotes.add(noteMap);

  // Convierte la lista actualizada en JSON y la guarda en el archivo.
  String newJsonString = jsonEncode(loadedNotes);
  await writeFile(newJsonString);

  // Muestra la lista actualizada para comprobar que la nueva nota fue guardada.
  print(loadedNotes);
}