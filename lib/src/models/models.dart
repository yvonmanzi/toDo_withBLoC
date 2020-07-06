import 'package:meta/meta.dart';

class Task {
  final String _task;

  Task({@required String task})
      : assert(task != null),
        _task = task;

  String get task => _task;

  static Task fromMap(Map<dynamic, dynamic> documentData) {
    return Task(task: documentData['task']);
  }
}
