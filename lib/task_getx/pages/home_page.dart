import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_last_lesson/task_getx/controllers/home_controller.dart';
import 'package:patterns_last_lesson/task_getx/views/item_of_post.dart';
class HomePage extends StatefulWidget {

  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Last Lesson"),
      ),
      body: Obx(() => Stack(
        children: [
          ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return itemOfPost(context, controller, controller.items[index]);
            },
          ),

          controller.isLoading() ? Center(
            child: CircularProgressIndicator(),
          ) : SizedBox.shrink(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          controller.apiCreatePost(context);
        },
      ),
    );
  }
}