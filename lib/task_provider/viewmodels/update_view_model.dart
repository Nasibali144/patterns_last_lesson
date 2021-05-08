import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:patterns_last_lesson/base/models/post_model.dart';
import 'package:patterns_last_lesson/base/services/dio_service.dart';

class UpdateViewModel extends ChangeNotifier {
  bool isLoading = false;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  late Post oldPost;

  void getOldPost(Post post) {
    oldPost = post;
    titleController.text = oldPost.title;
    bodyController.text = oldPost.body;
    notifyListeners();
  }

  Future apiUpdatePost(BuildContext context) async{
    isLoading = true;
    notifyListeners();

    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();
    Post post = Post(title: title, body: body, userId: oldPost.userId, id: oldPost.id);

    var response = await DioService.PUT(DioService.API_UPDATE + oldPost.id.toString(), DioService.paramsUpdate(post));
    isLoading = false;
    Navigator.pop(context, response);
    notifyListeners();
  }
}