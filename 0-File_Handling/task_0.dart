import 'dart:io';

void initializeLogFile() async {
  await Directory('storage').create(recursive: true);

  var myFile = File('storage/data.txt');
  await myFile.writeAsString("User activity log initialized");
}

void main() {
  initializeLogFile();
}