import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTaskButtonPressed extends TodoEvent {
  final String taskName;
  const AddTaskButtonPressed({@required this.taskName});
  @override
  List<Object> get props => [taskName];
}

class DeleteTaskButtonPressed extends TodoEvent {
  final String taskName;
  const DeleteTaskButtonPressed({@required this.taskName});

  @override
  List<Object> get props => [taskName];
}

class SeeTasksButtonPressed extends TodoEvent {}
