// import 'dart:io';
void main(){
  List<int> lista = [1, 2, 3];

  try {
    for(var i in lista){
      print(i);
    }
  } catch (error) {
    print("Hubo un error $error");
  }
}