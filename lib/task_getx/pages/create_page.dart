import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_last_lesson/task_getx/controllers/create_controller.dart';
import 'package:patterns_last_lesson/task_getx/views/view_of_create.dart';

class CreatePage extends StatelessWidget {

  static final String id = "create_page";
  final CreateController controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new post'),
      ),
      backgroundColor: Colors.white,
      body: Obx(() => viewOfCreate(context, controller)),
    );
  }
}
