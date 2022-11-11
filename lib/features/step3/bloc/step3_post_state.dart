part of 'step3_post_bloc.dart';

abstract class Step3PostState extends Equatable {
  const Step3PostState();

  @override
  List<Object> get props => [];
}

class Step3PostsLoading extends Step3PostState {}

class Step3PostsReceived extends Step3PostState {
  final List<Step3Post> posts;

  const Step3PostsReceived({required this.posts});

  @override
  List<Object> get props => [posts];
}
