import 'dart:io';

void readingAndWriting () async {
  var myFile = File('storage/data.txt');

  try {
    await myFile.writeAsString("\n✅ Se escribió en el archivo", mode: FileMode.append);
    String contents = await myFile.readAsString();
    print(contents);
  } on FileSystemException {
    print("Error: File not found");
  } catch (e) {
    print("Error: Could not read file");
  }
}

void main() {
  readingAndWriting();
}