import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_get_todo/src/constants/firebase_const.dart';
import 'package:flutter_get_todo/src/data/model/home_model.dart';

class todoApi {
  static Stream<List<HomeModel>> getTodos(String userId) {
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('todo')
        .orderBy('time', descending: true)
        .snapshots()
        .map(
      (QuerySnapshot query) {
        List<HomeModel> todos = [];
        for (var doc in query.docs) {
          final todoModel = HomeModel.froJson(doc);
          todos.add(todoModel);
        }
        return todos;
      },
    );
  }

  static Future<void> createTodo(String userId, HomeModel todoModel) {
    return firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('todo')
        .doc()
        .set(
      {
        'todo': todoModel.todo,
        'time': Timestamp.now(),
        'isDone': false,
      },
    );
  }

  static void updateTodo(String userId, String id) {
    firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('todo')
        .doc(id)
        .update(
      {
        'isDone': true,
      },
    );
  }

  static void deleteTodo(String userId, String id) {
    firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('todo')
        .doc(id)
        .delete();
  }
}
