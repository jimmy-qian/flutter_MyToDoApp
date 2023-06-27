import 'package:bloc/bloc.dart';
import 'package:my_todo_app/todo/data/todo_model.dart';

class ToDoCubit extends Cubit<List<ToDo>> {
  ToDoCubit() : super([]);

  void addToDo(String value) {
    final ToDo newToDo = new ToDo(title: value, isCompleted: false);

    emit([...state, newToDo]);
  }

  void clear() {
    emit(const []);
  }
}
