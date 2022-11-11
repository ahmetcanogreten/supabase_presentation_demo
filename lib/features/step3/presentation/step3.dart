import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:supabase_presentation/features/authentication/bloc/authentication_bloc.dart';
import 'package:supabase_presentation/features/step3/bloc/step3_post_bloc.dart';
import 'package:supabase_presentation/features/step3/models/step3_post.dart';
import 'package:supabase_presentation/features/step3/presentation/step3_post_create_widget.dart';
import 'package:supabase_presentation/features/step3/presentation/step3_post_widget.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is! LoggedIn) {
          return const Center(child: Text('Not Logged In Yet'));
        }
        return ListView(
          children: [
            BlocBuilder<Step3PostBloc, Step3PostState>(
              builder: (context, state) {
                List<Step3Post> posts = [];
                if (state is Step3PostsReceived) {
                  posts = state.posts;
                }
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<Step3PostBloc>().add(Step3GetPosts());
                        },
                        child: const Text('Refresh'),
                      ),
                      const SizedBox(height: 16),
                      const Step3PostCreateWidget(),
                      const SizedBox(height: 16),
                      state is Step3PostsLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: posts
                                  .map((post) => Step3PostWidget(post: post))
                                  .toList(),
                            ),
                    ],
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
