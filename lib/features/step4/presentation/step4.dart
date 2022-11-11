import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:supabase_presentation/features/authentication/bloc/authentication_bloc.dart';
import 'package:supabase_presentation/features/step4/bloc/step4_post_bloc.dart';
import 'package:supabase_presentation/features/step4/models/step4_post.dart';
import 'package:supabase_presentation/features/step4/presentation/step4_post_create_widget.dart';
import 'package:supabase_presentation/features/step4/presentation/step4_post_widget.dart';

class Step4 extends StatelessWidget {
  const Step4({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is! LoggedIn) {
          return const Center(child: Text('Not Logged In Yet'));
        }
        return ListView(
          children: [
            BlocBuilder<Step4PostBloc, Step4PostState>(
              builder: (context, state) {
                List<Step4Post> posts = [];
                if (state is Step4PostsReceived) {
                  posts = state.posts;
                }
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<Step4PostBloc>().add(Step4GetPosts());
                        },
                        child: const Text('Refresh'),
                      ),
                      const SizedBox(height: 16),
                      const Step4PostCreateWidget(),
                      const SizedBox(height: 16),
                      state is Step4PostsLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: posts
                                  .map((post) => Step4PostWidget(post: post))
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
