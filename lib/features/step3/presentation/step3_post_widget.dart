import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_presentation/features/step3/models/step3_post.dart';

class Step3PostWidget extends StatelessWidget {
  final Step3Post post;
  const Step3PostWidget({super.key, required this.post});

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
