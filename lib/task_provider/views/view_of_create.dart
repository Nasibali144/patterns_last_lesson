import 'package:flutter/material.dart';
import 'package:patterns_last_lesson/task_provider/viewmodels/create_view_model.dart';

Widget viewOfCreate(BuildContext context, CreateViewModel model) {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: model.titleController,
              decoration: InputDecoration(
                labelText: "Post Title",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(right: 15, left: 15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: model.bodyController,
              decoration: InputDecoration(
                labelText: "Post Body",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(
                    right: 15, top: 15, bottom: 50, left: 15),
              ),
              maxLines: 7,
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                child: Text('Create Post', style: TextStyle(color: Colors.white, fontSize: 20),),
                onPressed: () {
                  model.apiCreatePost(context);
                },
              ),
            ),
          ],
        ),
      ),

      model.isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
    ],
  );
}