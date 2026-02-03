import "dart:math";

Future<String> simulateNetworkCall() async {
  await Future.delayed(Duration(seconds: 2));
  
  var random = Random();
  int randomValue = random.nextInt(2);

  if(randomValue == 1){
    throw Exception("Network error");
  } else{
    return "Data received";
  }
}

void main() async {
  try{
    final result = await simulateNetworkCall();
    print(result);
  } catch(e){
    print("Fallback data");
  }
}