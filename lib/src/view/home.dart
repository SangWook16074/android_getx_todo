import 'package:flutter/material.dart';
import 'package:flutter_get_todo/src/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: controller.signOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            _create(),
            _todoList(),
          ],
        ),
      ),
    );
  }

  Widget _create() {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            controller: controller.createController,
          ),
        ),
        ElevatedButton(
            onPressed: controller.create, child: const Icon(Icons.send))
      ],
    );
  }

  Widget _todoList() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          final homeModel = controller.todos[index];
          return ListTile(
            leading: (homeModel.isDone!)
                ? GestureDetector(
                    onTap: () {
                      controller.deleteTodo(homeModel.id!, homeModel.userId!);
                    },
                    child: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      controller.updateTodo(homeModel.id!, homeModel.userId!);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
            title: Text(homeModel.todo),
            subtitle: Text(homeModel.time.toString()),
          );
        },
      ),
    );
  }
}
