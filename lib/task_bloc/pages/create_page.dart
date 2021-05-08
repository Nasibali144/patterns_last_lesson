import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_last_lesson/task_bloc/blocs/create_post_cubit.dart';
import 'package:patterns_last_lesson/task_bloc/blocs/create_post_state.dart';
import 'package:patterns_last_lesson/task_bloc/views/view_of_create.dart';

class CreatePage extends StatelessWidget {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Post"),
        ),
        body: BlocBuilder<CreatePostCubit, CreatePostState>(
          builder: (context, state) {
            if(state is CreatePostLoading) {
              return viewOfCreate(true, context, titleController, bodyController);
            }
            if(state is CreatePostLoaded) {
              _finish(context);
            }
            if(state is CreatePostError) {}

            return viewOfCreate(false, context, titleController, bodyController);
          },
        ),
      ),
    );
  }
}
