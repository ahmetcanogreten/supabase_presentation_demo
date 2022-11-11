part of 'step4_post_bloc.dart';

abstract class Step4PostState extends Equatable {
  const Step4PostState();

  @override
  List<Object> get props => [];
}

class Step4PostsLoading extends Step4PostState {}

class Step4PostsReceived extends Step4PostState {
  final List<Step4Post> posts;

  const Step4PostsReceived({required this.posts});

  @override
  List<Object> get props => [posts];
}
