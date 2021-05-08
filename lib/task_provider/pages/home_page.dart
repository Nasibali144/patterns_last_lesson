import 'package:flutter/material.dart';
import 'package:patterns_last_lesson/task_provider/viewmodels/home_view_model.dart';
import 'package:patterns_last_lesson/task_provider/views/item_of_post.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {

  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel model = HomeViewModel();

  @override
  void initState() {
    super.initState();
    model.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Last Lesson"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => model,
        child: Consumer<HomeViewModel>(
          builder: (context, model, widget) => Stack(
            children: [
              ListView.builder(
                itemCount: model.items.length,
                itemBuilder: (context, index) {
                  return itemOfPost(context, model, model.items[index]);
                },
              ),

              model.isLoading ? Center(
                child: CircularProgressIndicator(),
              ) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          model.apiCreatePost(context);
        },
      ),
    );
  }
}