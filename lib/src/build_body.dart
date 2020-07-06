import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertodoapp/src/bloc/bloc.dart';

class BuildBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoInitialState) return _buildTaskForm(context);

        if (state is TodoUserActionLoading) return CircularProgressIndicator();
        if (state is TodoUserActionFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Center(child: Text('sorry, it failed'))),
          );
        }
        return BuildTasksList();
      },
    );
  }

  Widget _buildTaskForm(BuildContext context) {
    final _bloc = BlocProvider.of<TodoBloc>(context);
    final taskController = TextEditingController();
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: taskController,
                decoration: InputDecoration(labelText: 'add a task'),
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    elevation: 0.0,
                    color: Colors.white,
                    child: Text(
                      'save',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () => _bloc.add(AddTaskButtonPressed(
                        taskName: taskController.text.toString())),
                  ),
                  FlatButton(
                    color: Colors.white,
                    child: Text('see tasks'),
                    onPressed: () => _bloc.add(SeeTasksButtonPressed()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
