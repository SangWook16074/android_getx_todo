import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModel {
  final String? id;
  final String? userId;
  final String? email;
  final String todo;
  final Timestamp? time;
  final bool? isDone;

  HomeModel(
      {this.id,
      this.userId,
      this.email,
      required this.todo,
      this.time,
      this.isDone});

  factory HomeModel.froJson(DocumentSnapshot doc) {
    return HomeModel(
      id: doc.id,
      userId: doc['userId'],
      email: doc['email'],
      todo: doc['todo'],
      time: doc['time'],
      isDone: doc['isDone'],
    );
  }

  factory HomeModel.toJson(String todo) {
    return HomeModel(todo: todo);
  }
}
