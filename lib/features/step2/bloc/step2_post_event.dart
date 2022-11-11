part of 'step2_post_bloc.dart';

abstract class Step2PostEvent extends Equatable {
  const Step2PostEvent();

  @override
  List<Object> get props => [];
}

class Step2GetPosts extends Step2PostEvent {}

class Step2CreatePost extends Step2PostEvent {
  final String title;
  final String body;

  const Step2CreatePost({required this.title, required this.body});

  @override
  List<Object> get props => [title, body];
}
