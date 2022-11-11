import 'package:flutter/material.dart';
import 'package:supabase_presentation/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Development with Supabase in Flutter',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(child: Image.asset('assets/supabase.png')),
                const SizedBox(width: 16),
                Expanded(child: Image.asset('assets/flutter.png')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
