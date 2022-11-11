import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_presentation/features/step3/bloc/step3_post_bloc.dart';

class Step3PostCreateWidget extends StatefulWidget {
  const Step3PostCreateWidget({super.key});

  @override
  State<Step3PostCreateWidget> createState() => _Step3PostCreateWidgetState();
}

class _Step3PostCreateWidgetState extends State<Step3PostCreateWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Create Post',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Body',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  context.read<Step3PostBloc>().add(
                        Step3CreatePost(
                          title: _titleController.text,
                          body: _bodyController.text,
                        ),
                      );
                },
                child: const Text('Post'))
          ],
        ),
      ),
    );
  }
}
