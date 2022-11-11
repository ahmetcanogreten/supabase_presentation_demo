import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_presentation/features/step2/models/step2_post.dart';

abstract class IStep2PostRepository {
  Future<List<Step2Post>> getPosts();
  Future<void> createPost({required String title, required String body});
}

class Step2PostRepository extends IStep2PostRepository {
  @override
  Future<List<Step2Post>> getPosts() async {
    try {
      final response = await Supabase.instance.client
          .from('step2_post')
          .select()
          .order('created_at', ascending: false);

      final posts =
          (response as List).map((e) => Step2Post.fromJson(e)).toList();
      return posts;
    } catch (e) {
      print(e); // TODO : Better error handling
      return [];
    }
  }

  @override
  Future<void> createPost({required String title, required String body}) async {
    try {
      await Supabase.instance.client.from('step2_post').insert({
        'title': title,
        'body': body,
        'owner_id': Supabase.instance.client.auth.currentUser!.id,
      });
    } catch (e) {
      print(e); // TODO : Better error handling
    }
  }
}
