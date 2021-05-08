import 'package:equatable/equatable.dart';

abstract class CreatePostState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreatePostInit extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostLoaded extends CreatePostState {
  final bool isCreated;

  CreatePostLoaded({required this.isCreated});
}

class CreatePostError extends CreatePostState {
  final error;
  CreatePostError({required this.error});
}