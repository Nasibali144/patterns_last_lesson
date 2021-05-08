import 'package:flutter/material.dart';
import 'package:patterns_last_lesson/base/models/post_model.dart';
import 'package:patterns_last_lesson/task_provider/viewmodels/update_view_model.dart';
import 'package:patterns_last_lesson/task_provider/views/view_of_update.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatelessWidget {

  static final String id = "update_page";
  final UpdateViewModel model = UpdateViewModel();
  final Post post;

  UpdatePage({required this.post});

  @override
  Widget build(BuildContext context) {
    model.getOldPost(post);
    return Scaffold(
      appBar: AppBar(
        title: Text('Update post'),
      ),
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => model,
        child: Consumer<UpdateViewModel>(
          builder: (context, model, child) => viewOfUpdate(context, model),
        ),
      ),
    );
  }
}
