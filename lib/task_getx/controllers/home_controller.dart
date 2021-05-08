import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_last_lesson/base/models/post_model.dart';
import 'package:patterns_last_lesson/base/pages/create_page.dart';
import 'package:patterns_last_lesson/base/pages/update_page.dart';
import 'package:patterns_last_lesson/base/services/dio_service.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Post> items = <Post>[].obs;

  Future apiPostList() async {
    isLoading(true);

    var response = await DioService.GET(DioService.API_LIST, DioService.paramsEmpty());
    if(response != null) items.value = DioService.parsePostList(response);
    isLoading(false);
  }

  Future<void> apiPostDelete(Post post) async {
    isLoading(false);

    var response = await DioService.DEL(DioService.API_DELETE + post.id.toString(), DioService.paramsEmpty());
    if(response != null) {
      items.remove(post);
    }
    isLoading(false);
  }

  Future<void> apiUpdatePost(BuildContext context, Post post) async{
    String? result;
    result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePage(post: post,)));
    if(result != null) {
      Post newPost = DioService.parsePost(result);
      items[items.indexWhere((element) => element.id == newPost.id)] = newPost;
    }
  }

  Future<void> apiCreatePost(BuildContext context) async{
    String? result;
    result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePage()));
    if(result != null) items.add(DioService.parsePost(result));
  }
}