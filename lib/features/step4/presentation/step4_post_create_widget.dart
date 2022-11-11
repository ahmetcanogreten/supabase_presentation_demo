import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_presentation/features/step4/bloc/step4_post_bloc.dart';

class Step4PostCreateWidget extends StatefulWidget {
  const Step4PostCreateWidget({super.key});

  @override
  State<Step4PostCreateWidget> createState() => _Step4PostCreateWidgetState();
}

class _Step4PostCreateWidgetState extends State<Step4PostCreateWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  XFile? coverImage;
  late final ImagePicker _picker;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

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
            coverImage != null
                ? Image.file(
                    File(coverImage!.path),
                    height: 200,
                    width: 200,
                  )
                : ElevatedButton.icon(
                    onPressed: () async {
                      coverImage =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {});
                    },
                    icon: const Icon(Icons.image),
                    label: const Text('Choose image')),
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
                  context.read<Step4PostBloc>().add(
                        Step4CreatePost(
                          title: _titleController.text,
                          body: _bodyController.text,
                          coverUrlPath: coverImage?.path ?? '',
                        ),
                      );

                  setState(() {
                    _titleController.clear();
                    _bodyController.clear();
                    coverImage = null;
                  });
                },
                child: const Text('Post'))
          ],
        ),
      ),
    );
  }
}
