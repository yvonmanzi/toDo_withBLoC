import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertodoapp/src/repository/repository.dart';
import 'package:meta/meta.dart';

import './bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository;

  TodoBloc({@required repository})
      : assert(repository != null),
        _repository = repository;

  @override
  TodoState get initialState => TodoInitialState();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AddTaskButtonPressed) {
      yield TodoUserActionLoading();
      try {
        _repository.addTask(taskName: event.taskName);
        yield TodoUserActionSuccess();
      } catch (_) {
        yield TodoUserActionFailure();
      }
    } else if (event is SeeTasksButtonPressed) {
      yield TodoUserActionLoading();
      try {
        _repository.getTasks();
        yield TodoUserActionSuccess();
      } catch (_) {
        yield TodoUserActionFailure();
      }
    } else if (event is DeleteTaskButtonPressed) {
      yield TodoUserActionLoading();
      try {
        _repository.deleteTask(taskName: event.taskName);
        yield TodoUserActionSuccess();
      } catch (_) {
        yield TodoUserActionFailure();
      }
    }
  }
}
