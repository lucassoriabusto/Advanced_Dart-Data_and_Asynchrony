import 'dart:io';

// Solicita al usuario el título y contenido de una nueva nota.
// Devuelve esos datos en un Map para que puedan utilizarse al crear la Note.
Map<String, dynamic> prompt(){
  try {
    print("Enter the title:");
    String title = stdin.readLineSync() ?? "";

    print("Enter the content:");
    String body = stdin.readLineSync() ?? "";

    Map<String, dynamic> noteData = {
      "title": title,
      "body": body,
      };

    return noteData;
  } catch (error) {
    print("Error reading user input: $error");
    return {};
  }
}