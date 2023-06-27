import 'package:equatable/equatable.dart';

final class ToDo extends Equatable {
  const ToDo({
    required this.title,
    required this.isCompleted,
  });

  final String title;
  final bool isCompleted;

  @override
  List<Object> get props => [title, isCompleted];
}
