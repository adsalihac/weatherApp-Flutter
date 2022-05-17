import 'dart:io';

import 'package:flutter/foundation.dart';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task1 data';
  if (kDebugMode) {
    print('Task 1 completed');
  }
}

Future<String> task2() async {
  Duration threeSeconds = const Duration(seconds: 3);
  //synchronous
  // sleep(threeSeconds);

  String result = "";

  // asynchronous
  await Future.delayed(threeSeconds , () {
    result = 'task2 data';
    if (kDebugMode) {
      print('Task 2 completed');
    }
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task3 data';
  if (kDebugMode) {
    print('Task 3 completed with $task2Data');
  }
}