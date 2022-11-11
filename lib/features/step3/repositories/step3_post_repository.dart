import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_presentation/features/step3/models/step3_post.dart';

abstract class IStep3PostRepository {
  Future<List<Step3Post>> getPosts();
  Future<void> createPost({required String title, required String body});
}

class Step3PostRepository extends IStep3PostRepository {
  @override
  Future<List<Step3Post>> getPosts() async {
    try {
      final response = await Supabase.instance.client
          .from('step3_post')
          .select()
          .order('created_at', ascending: false);

      final posts =
          (response as List).map((e) => Step3Post.fromJson(e)).toList();
      return posts;
    } catch (e) {
      print(e); // TODO : Better error handling
      return [];
    }
  }

  @override
  Future<void> createPost({required String title, required String body}) async {
    try {
      await Supabase.instance.client.from('step3_post').insert({
        'title': title,
        'body': body,
        'owner_id': Supabase.instance.client.auth.currentUser!.id,
      });
    } catch (e) {
      print(e); // TODO : Better error handling
    }
  }
}
