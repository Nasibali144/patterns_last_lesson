import 'package:equatable/equatable.dart';
import 'package:patterns_last_lesson/task_bloc/models/post_model.dart';

abstract class ListPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListPostInit extends ListPostState {}

class ListPostLoading extends ListPostState {}

class ListPostLoaded extends ListPostState {
  final List<Post>? posts;
  final bool? isDeleted;

  ListPostLoaded({ this.posts, this.isDeleted});
}

class ListPostError extends ListPostState {
  final error;

  ListPostError({required this.error});
}