import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:supabase_presentation/features/authentication/bloc/authentication_bloc.dart';
import 'package:supabase_presentation/features/step2/bloc/step2_post_bloc.dart';
import 'package:supabase_presentation/features/step2/models/step2_post.dart';
import 'package:supabase_presentation/features/step2/presentation/step2_post_create_widget.dart';
import 'package:supabase_presentation/features/step2/presentation/step2_post_widget.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is! LoggedIn) {
          return const Center(child: Text('Not Logged In Yet'));
        }
        return ListView(
          children: [
            BlocBuilder<Step2PostBloc, Step2PostState>(
              builder: (context, state) {
                List<Step2Post> posts = [];
                if (state is Step2PostsReceived) {
                  posts = state.posts;
                }
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<Step2PostBloc>().add(Step2GetPosts());
                        },
                        child: const Text('Refresh'),
                      ),
                      const SizedBox(height: 16),
                      Step2PostCreateWidget(),
                      const SizedBox(height: 16),
                      state is Step2PostsLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: posts
                                  .map((post) => Step2PostWidget(post: post))
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
