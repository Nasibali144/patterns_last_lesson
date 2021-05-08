import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_last_lesson/base/models/post_model.dart';
import 'package:patterns_last_lesson/task_provider/viewmodels/home_view_model.dart';

Widget itemOfPost(BuildContext context, HomeViewModel model, Post post) {
  return Slidable(
    child: Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title.toUpperCase(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text(post.body),
        ],
      ),
    ),
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    actions: [
      IconSlideAction(
        caption: 'Update',
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {
          model.apiUpdatePost(context, post);
        },
      ),
    ],
    secondaryActions: [
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          model.apiPostDelete(post);
        },
      ),
    ],
  );
}