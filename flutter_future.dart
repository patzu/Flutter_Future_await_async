void main() {
  tasks();
  task4(); // this method will run with parallelism
}

void tasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
  task5(); //this method will execute after await
}

void task1() {
  String result = 'Task1 result';
  print(result);
}

Future<String> task2() async {
  String result;
  Duration duration = Duration(seconds: 5);
  // sleep(duration); //Artificial synchronous delay

  await Future.delayed(duration, () {
    result = 'Task2 result';
    print(result);
  });
  return result;
}

void task3(String task2Result) {
  String result = 'Task3 result depend on $task2Result';
  print(result);
}

void task4() {
  String result = 'Task4 result';
  print(result);
}

void task5() {
  String result = 'Task5 result';
  print(result);
}
