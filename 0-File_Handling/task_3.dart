import 'dart:io';

void listStorageFiles() async {
  var myDir = Directory('storage');
  
  var files = myDir.listSync();

  List<String> listFile = [];
  
  for(var f in files){
    listFile.add(f.path.split("/").last);

    // Forma larga
    // var ruta = f.path;
    // var lastElement = ruta.split("/").last;
    // listFile.add(lastElement);
    
  }
  print(listFile);
}

void main(){
  listStorageFiles();
}