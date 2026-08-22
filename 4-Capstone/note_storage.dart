import 'dart:io';

// Crea el directorio storage si no existe y guarda el contenido recibido en el archivo storage/notes.json.
Future writeFile(jsonFile) async{
  await Directory("storage").create(recursive: true);
  
  var json = File("storage/notes.json");
  await json.writeAsString(jsonFile);
}

// Lee el contenido de storage/notes.json y lo devuelve como String.
// Se utiliza para recuperar el JSON almacenado.
Future readFile() async {
  var myFile = File("storage/notes.json");

  String contents = await myFile.readAsString();
  return contents;
}