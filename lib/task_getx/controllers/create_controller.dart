import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_last_lesson/base/models/post_model.dart';
import 'package:patterns_last_lesson/base/services/dio_service.dart';

class CreateController extends GetxController {
  RxBool isLoading = false.obs;
  var titleController = TextEditingController().obs;
  var bodyController = TextEditingController().obs;

  Future apiCreatePost(BuildContext context) async{
    isLoading(true);

    String title = titleController.value.text.trim().toString();
    String body = bodyController.value.text.trim().toString();
    Post post = Post(title: title, body: body, userId: 1);

    var response = await DioService.POST(DioService.API_CREATE, DioService.paramsCreate(post));
    isLoading(false);
    Navigator.pop(context, response);
  }
}