part of 'step4_post_bloc.dart';

abstract class Step4PostEvent extends Equatable {
  const Step4PostEvent();

  @override
  List<Object> get props => [];
}

class Step4GetPosts extends Step4PostEvent {}

class Step4CreatePost extends Step4PostEvent {
  final String title;
  final String body;
  final String coverUrlPath;

  const Step4CreatePost(
      {required this.title, required this.body, required this.coverUrlPath});

  @override
  List<Object> get props => [title, body];
}
