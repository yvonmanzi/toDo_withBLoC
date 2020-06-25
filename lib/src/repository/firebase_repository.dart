import 'package:fluttertodoapp/src/repository/firebase_instance_provider.dart';
import 'package:meta/meta.dart';

class FirebaseRepository {
  final FirebaseInstanceProvider _firebaseInstanceProvider;

  FirebaseRepository(
      {@required FirebaseInstanceProvider firebaseInstanceProvider})
      : assert(firebaseInstanceProvider != null),
        _firebaseInstanceProvider = firebaseInstanceProvider;

  Future<void> addTask({@required String taskName}) async {
    await _firebaseInstanceProvider.addTask(taskName: taskName);
  }

  Future<List<Task>> getTasks() async {
    return await _firebaseInstanceProvider.getAllTasks();
  }
}
