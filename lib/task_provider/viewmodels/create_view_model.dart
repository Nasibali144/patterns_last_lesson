import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:patterns_last_lesson/base/models/post_model.dart';
import 'package:patterns_last_lesson/base/services/dio_service.dart';

class CreateViewModel extends ChangeNotifier {
  bool isLoading = false;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  Future apiCreatePost(BuildContext context) async{
    isLoading = true;
    notifyListeners();

    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();
    Post post = Post(title: title, body: body, userId: 1);

    var response = await DioService.POST(DioService.API_CREATE, DioService.paramsCreate(post));
    isLoading = false;
    notifyListeners();
    Navigator.pop(context, response);
  }
}