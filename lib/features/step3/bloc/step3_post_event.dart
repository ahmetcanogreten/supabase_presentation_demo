part of 'step3_post_bloc.dart';

abstract class Step3PostEvent extends Equatable {
  const Step3PostEvent();

  @override
  List<Object> get props => [];
}

class Step3GetPosts extends Step3PostEvent {}

class Step3CreatePost extends Step3PostEvent {
  final String title;
  final String body;

  const Step3CreatePost({required this.title, required this.body});

  @override
  List<Object> get props => [title, body];
}
