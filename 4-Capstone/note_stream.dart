// Crea un Stream que emite cada elemento de la lista con un retraso de 1 segundo.
Stream<dynamic> streamNotes(List<dynamic> list) async*{
  try {
    for(var i in list){
      yield i;
      await Future.delayed(Duration(seconds: 1));
    }
  } catch (error){
    print("An error occurred: $error");
  }
}