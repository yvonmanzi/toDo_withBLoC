import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FirebaseInstanceProvider {
  final Firestore _firestoreInstance;

  FirebaseInstanceProvider({@required Firestore firestoreInstance})
      : assert(firestoreInstance != null),
        _firestoreInstance = firestoreInstance;

  Future<void> addTask({@required String taskName}) async {
    try {
      _firestoreInstance
          .collection('toDos')
          .document('${taskName.toLowerCase()}')
          .setData({'task': taskName});
    } catch (_) {
      print("something happened thus cant' add task");
    }
  }

  Future<void> deleteTask({@required String taskName}) async {
    try {
      await _firestoreInstance
          .collection('toDos')
          .document('${taskName.toLowerCase()}')
          .delete();
    } catch (_) {
      print(" can't delete for some reason");
    }
  }

  Future<List<Task>> getAllTasks() async {
    try {
      return await _firestoreInstance.collection('toDos').getDocuments().then(
          (QuerySnapshot snapshot) => snapshot.documents
              .map((document) => Task.fromMap(document.data))
              .toList());
    } catch (_) {
      print("couldn't get tasks");
      return null;
    }
  }
}

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
