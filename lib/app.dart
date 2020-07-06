import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertodoapp/src/bloc/bloc.dart';
import 'package:fluttertodoapp/src/build_body.dart';
import 'package:fluttertodoapp/src/repository/todo_repository.dart';

class App extends StatefulWidget {
  final TodoRepository _repository;

  App({@required TodoRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final TextEditingController taskController = TextEditingController();
  TodoRepository _repository;

  @override
  void initState() {
    _repository = widget._repository;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:
              Align(alignment: Alignment.center, child: Text('do cool shit')),
        ),
        body: BlocProvider<TodoBloc>(
            create: (BuildContext context) => TodoBloc(repository: _repository),
            child: BuildBody()),
      ),
    );
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }
}
