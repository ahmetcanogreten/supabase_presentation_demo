import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_presentation/features/step4/models/step4_post.dart';
import 'package:uuid/uuid.dart';

abstract class IStep4PostRepository {
  Future<List<Step4Post>> getPosts();
  Future<void> createPost(
      {required String title,
      required String body,
      required String coverUrlPath});
  Future<String> uploadCoverImage({required String coverUrlPath});
}

class Step4PostRepository extends IStep4PostRepository {
  @override
  Future<List<Step4Post>> getPosts() async {
    try {
      final response = await Supabase.instance.client
          .from('step4_post')
          .select()
          .order('created_at', ascending: false);

      final posts =
          (response as List).map((e) => Step4Post.fromJson(e)).toList();
      return posts;
    } catch (e) {
      print(e); // TODO : Better error handling
      return [];
    }
  }

  @override
  Future<void> createPost(
      {required String title,
      required String body,
      required String coverUrlPath}) async {
    try {
      await Supabase.instance.client.from('step4_post').insert({
        'title': title,
        'body': body,
        'owner_id': Supabase.instance.client.auth.currentUser!.id,
        'cover_url': coverUrlPath,
      });
    } catch (e) {
      print(e); // TODO : Better error handling
    }
  }

  @override
  Future<String> uploadCoverImage({required String coverUrlPath}) async {
    try {
      final String uploadedPath = await Supabase.instance.client.storage
          .from('covers')
          .upload('${const Uuid().v4()}.png', File(coverUrlPath),
              fileOptions: const FileOptions(contentType: 'image/png'));

      final signedUrl = await Supabase.instance.client.storage
          .from('covers')
          .createSignedUrl(uploadedPath.substring(7),
              60 * 60 * 24 * 364); // URLs last for a year
      return signedUrl;
    } catch (e) {
      print(e); // TODO : Better error handling
      return '';
    }
  }
}
