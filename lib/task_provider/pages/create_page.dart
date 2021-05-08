import 'package:flutter/material.dart';
import 'package:patterns_last_lesson/task_provider/viewmodels/create_view_model.dart';
import 'package:patterns_last_lesson/task_provider/views/view_of_create.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatelessWidget {

  static final String id = "create_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new post'),
      ),
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => CreateViewModel(),
        builder: (context, child) => Consumer<CreateViewModel>(
          builder: (context, model, child) => viewOfCreate(context, model)),
      ),
    );
  }
}
