part of 'step2_post_bloc.dart';

abstract class Step2PostState extends Equatable {
  const Step2PostState();

  @override
  List<Object> get props => [];
}

class Step2PostsLoading extends Step2PostState {}

class Step2PostsReceived extends Step2PostState {
  final List<Step2Post> posts;

  const Step2PostsReceived({required this.posts});

  @override
  List<Object> get props => [posts];
}
