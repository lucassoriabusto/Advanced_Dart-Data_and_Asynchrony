Stream<int> emitWithDelay(List<int> values) async*{
  for(var value in values){
    await Future.delayed(Duration(milliseconds: 500));
    yield value;
  }
}

void main() {
  emitWithDelay([1, 2, 3, 4]).listen((event) {
    print(event);
  });
}