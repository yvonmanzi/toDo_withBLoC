import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitialState extends TodoState {}

class TodoUserActionLoading extends TodoState {}

class TodoUserActionSuccess extends TodoState {}

class TodoUserActionFailure extends TodoState {}
