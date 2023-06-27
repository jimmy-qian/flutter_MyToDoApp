import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/todo/cubit/todo_cubit.dart';
import 'package:my_todo_app/todo/data/todo_model.dart';

class ToDoView extends StatelessWidget {
  ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ToDoCubit, List<ToDo>>(builder: (context, listToDo) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Overview'),
                  SizedBox(height: 16),
                  AddToDoForm(),
                  SizedBox(height: 16),
                  Expanded(
                    child: ToDoListView(listToDo: listToDo),
                  ),
                  ClearToDoButton(
                    isDisabled: listToDo.length == 0,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ToDoListView extends StatelessWidget {
  const ToDoListView({super.key, required this.listToDo});

  final List<ToDo> listToDo;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (ToDo todo in listToDo) ListTile(title: Text(todo.title)),
      ],
    );
  }
}

class ClearToDoButton extends StatelessWidget {
  const ClearToDoButton({
    super.key,
    required this.isDisabled,
  });

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: isDisabled ? null : context.read<ToDoCubit>().clear,
        child: Text('Clear all'));
  }
}

class AddToDoForm extends StatelessWidget {
  AddToDoForm({super.key});

  final inputController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void onPressAdd() {
      if (_formKey.currentState!.validate()) {
        final value = inputController.text;

        context.read<ToDoCubit>().addToDo(value);
        inputController.clear();
      }
    }

    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                return null;
              },
              controller: inputController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
        ),
        Spacer(flex: 1),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: onPressAdd,
          child: Text(
            'ADD',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
