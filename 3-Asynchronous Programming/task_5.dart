Future<List<String>> runParallelCalls() async {
  return Future.wait([
    Future.delayed(const Duration(seconds: 1), () => "First"),
    Future.delayed(const Duration(seconds: 2), () => "Second"),
    Future.delayed(const Duration(seconds: 3), () => "Third"),
  ]);
}

void main() async {
  final result = await runParallelCalls();
  print(result);
}