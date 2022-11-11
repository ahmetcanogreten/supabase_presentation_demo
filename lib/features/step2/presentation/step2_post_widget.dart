import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_presentation/features/step2/models/step2_post.dart';

class Step2PostWidget extends StatelessWidget {
  final Step2Post post;
  const Step2PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              post.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(post.body),
            const SizedBox(height: 8),
            Text(
              DateFormat.yMMMMd().format(post.createdAt),
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Theme.of(context).disabledColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
