import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodoapp/src/repository/firebase_instance_provider.dart';
import 'package:fluttertodoapp/src/repository/todo_repository.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    repository: TodoRepository(
        firebaseInstanceProvider:
            FirebaseInstanceProvider(firestoreInstance: Firestore.instance)),
  ));
}
