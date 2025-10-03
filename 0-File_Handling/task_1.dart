import 'dart:io';

void appendLogEntry() async {
  var myFile = File('storage/data.txt');
  await myFile.writeAsString("\n${DateTime.now().toIso8601String()}", mode: FileMode.append,);
}

void main() {
  appendLogEntry();
}