import 'package:bloc/bloc.dart';
import 'package:patterns_last_lesson/task_bloc/models/post_model.dart';
import 'package:patterns_last_lesson/task_bloc/services/dio_service.dart';
import 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInit());

  void apiPostCreate (Post post) async{
    print(post.toJson());
    emit(CreatePostLoading());
    final response = await DioService.POST(DioService.API_CREATE, DioService.paramsCreate(post));
    print(response);
    if(response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}