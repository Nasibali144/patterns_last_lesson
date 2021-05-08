import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_last_lesson/base/models/post_model.dart';
import 'package:patterns_last_lesson/base/services/dio_service.dart';

class UpdateController extends GetxController {
  RxBool isLoading = false.obs;
  var titleController = TextEditingController().obs;
  var bodyController = TextEditingController().obs;
  late Post oldPost;

  void getOldPost(Post post) {
    oldPost = post;
    titleController.value.text = oldPost.title;
    bodyController.value.text = oldPost.body;
  }

  Future apiUpdatePost(BuildContext context) async{
    isLoading(true);

    String title = titleController.value.text.trim().toString();
    String body = bodyController.value.text.trim().toString();
    Post post = Post(title: title, body: body, userId: oldPost.userId, id: oldPost.id);

    var response = await DioService.PUT(DioService.API_UPDATE + oldPost.id.toString(), DioService.paramsUpdate(post));
    isLoading(false);
    Navigator.pop(context, response);
  }
}