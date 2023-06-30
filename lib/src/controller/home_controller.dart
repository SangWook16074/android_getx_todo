import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_get_todo/src/constants/firebase_const.dart';
import 'package:flutter_get_todo/src/data/model/home_model.dart';
import 'package:flutter_get_todo/src/provider/firebase_db.dart';
import 'package:flutter_get_todo/src/repository/todo_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<List<HomeModel>> _todos = Rx<List<HomeModel>>([]);
  final TextEditingController _controller = TextEditingController();

  List<HomeModel> get todos => _todos.value;
  TextEditingController get createController => _controller;

  @override
  void onReady() {
    super.onReady();
    final userId = FirebaseAuth.instance.currentUser!.uid;
    _todos.bindStream(TodoRepository.fetchTodos(userId));
  }

  void create() {
    final todo = _controller.value.text;
    if (todo.isNotEmpty) {
      try {
        final homeModel = HomeModel.toJson(todo);

        final userId = FirebaseAuth.instance.currentUser!.uid;
        todoApi.createTodo(userId, homeModel);
        _controller.clear();
      } catch (e) {
        debugPrint("Error");
      }
    }
  }

  void updateTodo(String userId, String id) {
    try {
      todoApi.updateTodo(userId, id);
    } catch (e) {
      debugPrint("Error");
    }
  }

  void deleteTodo(String userId, String id) {
    try {
      todoApi.deleteTodo(userId, id);
    } catch (e) {
      debugPrint("Error");
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print('Error');
    }
  }
}
