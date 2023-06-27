import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/app.dart';
import 'package:my_todo_app/todo/todo_observer.dart';

void main() {
  Bloc.observer = const ToDoObserver();
  runApp(ToDoApp());
}
