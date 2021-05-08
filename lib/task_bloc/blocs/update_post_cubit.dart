import 'package:bloc/bloc.dart';
import 'package:patterns_last_lesson/task_bloc/blocs/update_post_state.dart';
import 'package:patterns_last_lesson/task_bloc/models/post_model.dart';
import 'package:patterns_last_lesson/task_bloc/services/dio_service.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInit());

  void apiPostUpdate(Post post) async{
    post.userId = 1;
    print(post.toJson());
    emit(UpdatePostLoading());
    final response;
    response = DioService.PUT(DioService.API_UPDATE + post.id.toString(), DioService.paramsUpdate(post));
    if(response != null) {
      emit(UpdatePostLoaded(isUpdate: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}