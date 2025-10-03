import 'dart:io';

void readLogFile() async {
  var myFile = File('storage/data.txt');
  
  List<String> contents = await myFile.readAsLines();
  print(contents);
}

void main() {
  readLogFile();
}