import 'dart:io';

// Solicita al usuario el título y contenido de una nueva nota.
// Devuelve esos datos en un Map para que puedan utilizarse al crear la Note.
Map<String, dynamic> prompt(){
  print("Ingrese el título:");
  String title = stdin.readLineSync() ?? "";

  print("Ingrese el contenido:");
  String body = stdin.readLineSync() ?? "";

  Map<String, dynamic> noteData = {
    "title": title,
    "body": body,
    };

  return noteData;
}