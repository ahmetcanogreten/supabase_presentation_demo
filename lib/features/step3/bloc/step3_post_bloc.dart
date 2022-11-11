import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_presentation/features/step3/models/step3_post.dart';
import 'package:supabase_presentation/features/step3/repositories/step3_post_repository.dart';

part 'step3_post_event.dart';
part 'step3_post_state.dart';

class Step3PostBloc extends Bloc<Step3PostEvent, Step3PostState> {
  IStep3PostRepository step3postRepository;
  Step3PostBloc({required this.step3postRepository})
      : super(Step3PostsLoading()) {
    on<Step3GetPosts>((event, emit) async {
      emit(Step3PostsLoading());
      final posts = await step3postRepository.getPosts();
      emit(Step3PostsReceived(posts: posts));
    });

    on<Step3CreatePost>((event, emit) async {
      await step3postRepository.createPost(
        title: event.title,
        body: event.body,
      );
      add(Step3GetPosts());
    });
  }
}
