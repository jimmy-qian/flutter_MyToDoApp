import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/todo/cubit/todo_cubit.dart';
import 'package:my_todo_app/todo/index.dart';

class ToDoPage extends StatelessWidget {
  /// {@macro counter_page}
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ToDoCubit(),
      child: ToDoView(),
    );
  }
}
