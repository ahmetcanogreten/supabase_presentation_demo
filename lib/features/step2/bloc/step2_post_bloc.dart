import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_presentation/features/step2/repositories/step2_post_repository.dart';
import '../models/step2_post.dart';

part 'step2_post_event.dart';
part 'step2_post_state.dart';

class Step2PostBloc extends Bloc<Step2PostEvent, Step2PostState> {
  IStep2PostRepository step2postRepository;
  Step2PostBloc({required this.step2postRepository})
      : super(Step2PostsLoading()) {
    on<Step2GetPosts>((event, emit) async {
      emit(Step2PostsLoading());
      final posts = await step2postRepository.getPosts();
      emit(Step2PostsReceived(posts: posts));
    });

    on<Step2CreatePost>((event, emit) async {
      await step2postRepository.createPost(
        title: event.title,
        body: event.body,
      );
      add(Step2GetPosts());
    });
  }
}
