import "dart:convert";
import "note.dart";
import "note_storage.dart";

Future<void> main() async {

  // Lista de notas que queremos guardar localmente.
  List<Note> notes = [
    Note(1, "Estudiar Dart", "Repasar JSON", DateTime.now()),
    Note(2, "Estudiar Dart", "Repasar JSON", DateTime.now()),
  ];

  // Convierte cada objeto Note en un Map para poder serializarlo a JSON.
  List<Map<String, dynamic>> noteMaps = [];

  for (var note in notes) {
    Map<String, dynamic> noteMap = note.toJson();

    noteMaps.add(noteMap);
  }

  // Convierte la lista de Maps en un String con formato JSON.
  String notesJson = jsonEncode(noteMaps);

  // Guarda el JSON en storage/notes.json.
  await writeFile(notesJson);

  // Lee el JSON guardado y lo convierte nuevamente en una lista de datos.
  String jsonString = await readFile();
  List<dynamic> decodedNotes = jsonDecode(jsonString);

  // Reconstruye los objetos Note a partir de los datos obtenidos del JSON.
  List<Note> loadedNotes = [];

  for (var noteData in decodedNotes) {
    Note note = Note.fromJson(noteData);
    loadedNotes.add(note);
  }

  // Muestra las notas recuperadas para comprobar que fueron cargadas correctamente.
  for (var note in loadedNotes) {
    print("ID: ${note.id}");
    print("Título: ${note.title}");
    print("Contenido: ${note.body}");
    print("Fecha: ${note.createdAt}");
    print("");
  }
}