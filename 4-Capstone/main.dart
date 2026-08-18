import "dart:convert";
import "note.dart";

void main() {
  // 1. Creo una Note normalmente
  Note nota1 = Note(
    1,
    "Estudiar Dart",
    "Repasar JSON",
    DateTime.now(),
  );

  // 2. Convierto la Note en un Map
  Map<String, dynamic> datos = nota1.toJson();

  print("MAP:");
  print(datos);

  // 3. Convierto el Map en un String JSON
  String jsonString = jsonEncode(datos);

  print("");
  print("JSON:");
  print(jsonString);

  // 4. Convierto el JSON nuevamente en un Map
  Map<String, dynamic> datosDecodificados = jsonDecode(jsonString);

  print("");
  print("MAP DECODIFICADO:");
  print(datosDecodificados);

  // 5. Creo una nueva Note usando fromJson()
  Note nota2 = Note.fromJson(datosDecodificados);

  print("");
  print("NOTA RECONSTRUIDA:");
  print("ID: ${nota2.id}");
  print("Título: ${nota2.title}");
  print("Cuerpo: ${nota2.body}");
  print("Fecha: ${nota2.createdAt}");
}