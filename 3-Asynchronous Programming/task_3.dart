import 'dart:async';

Stream<int> emitWithDelay(List<int> values) async*{
  for(var value in values){
    await Future.delayed(Duration(milliseconds: 500));
    yield value;
  }
}

void listenAndCancel(Stream<int> stream){
  int counter = 0;

  late StreamSubscription<int> subscription;

  subscription = stream.listen((event) {
    counter++;
    print(event);

    if(counter == 3){
      subscription.cancel();
    }
  });
}

void main() {
  final numberStream = emitWithDelay([1, 2, 3, 4]);
  listenAndCancel(numberStream);
}