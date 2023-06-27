import 'package:flutter/material.dart';
import 'package:my_todo_app/todo/index.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [CounterPage].
/// {@endtemplate}
class ToDoApp extends MaterialApp {
  /// {@macro counter_app}
  ToDoApp({super.key})
      : super(
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: const ToDoPage(),
        );
}
