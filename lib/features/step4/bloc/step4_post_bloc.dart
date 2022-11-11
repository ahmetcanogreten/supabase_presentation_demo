import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_presentation/features/step4/models/step4_post.dart';
import 'package:supabase_presentation/features/step4/repositories/step4_post_repository.dart';

part 'step4_post_event.dart';
part 'step4_post_state.dart';

class Step4PostBloc extends Bloc<Step4PostEvent, Step4PostState> {
  IStep4PostRepository step4postRepository;
  Step4PostBloc({required this.step4postRepository})
      : super(Step4PostsLoading()) {
    on<Step4GetPosts>((event, emit) async {
      emit(Step4PostsLoading());
      final posts = await step4postRepository.getPosts();
      emit(Step4PostsReceived(posts: posts));
    });

    on<Step4CreatePost>((event, emit) async {
      try {
        final coverImageUrl = await step4postRepository.uploadCoverImage(
          coverUrlPath: event.coverUrlPath,
        );

        await step4postRepository.createPost(
          title: event.title,
          body: event.body,
          coverUrlPath: coverImageUrl,
        );

        add(Step4GetPosts());
      } catch (e) {
        print(e); // TODO : Better error handling
      }
    });
  }
}
