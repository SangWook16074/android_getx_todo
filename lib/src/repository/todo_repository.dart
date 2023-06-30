import 'package:flutter_get_todo/src/data/model/home_model.dart';
import 'package:flutter_get_todo/src/provider/firebase_db.dart';

class TodoRepository {
  static Stream<List<HomeModel>> fetchTodos(String userId) =>
      todoApi.getTodos(userId);
}
