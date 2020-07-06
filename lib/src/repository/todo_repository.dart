import 'package:fluttertodoapp/src/repository/firebase_instance_provider.dart';
import 'package:meta/meta.dart';

import '../models/models.dart';

class TodoRepository {
  final FirebaseInstanceProvider _firebaseInstanceProvider;

  TodoRepository({@required FirebaseInstanceProvider firebaseInstanceProvider})
      : assert(firebaseInstanceProvider != null),
        _firebaseInstanceProvider = firebaseInstanceProvider;

  Future<void> addTask({@required String taskName}) async {
    await _firebaseInstanceProvider.addTask(taskName: taskName);
  }

  Future<List<Task>> getTasks() async {
    return await _firebaseInstanceProvider.getAllTasks();
  }

  Future<void> deleteTask({@required String taskName}) async {
    return await _firebaseInstanceProvider.deleteTask(taskName: taskName);
  }
}
