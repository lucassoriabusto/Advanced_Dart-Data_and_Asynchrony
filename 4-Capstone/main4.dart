import 'dart:convert';
import 'note_storage.dart';
import 'note_stream.dart';

Future main() async{
  String jsonString = await readFile();
  
  List<dynamic> decodedNotes = jsonDecode(jsonString);

  // Escucha el Stream y muestra cada nota a medida que es emitida
  await for(var item in streamNotes(decodedNotes)){
    print(item);
  }
}