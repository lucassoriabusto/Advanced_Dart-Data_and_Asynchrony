import 'dart:io';

bool deleteLogFileIfExists(){
  var myFile = File('storage/data.txt');

  if(myFile.existsSync()){
    myFile.deleteSync();
    return true;
  } else{
    return false;
  }
}

void main(){
  deleteLogFileIfExists();
}
