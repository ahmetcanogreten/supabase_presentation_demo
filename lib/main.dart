import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_presentation/features/authentication/bloc/authentication_bloc.dart';
import 'package:supabase_presentation/features/authentication/repositories/authentication_repository.dart';
import 'package:supabase_presentation/features/splash/presentation/splash_page.dart';
import 'package:supabase_presentation/features/step2/bloc/step2_post_bloc.dart';
import 'package:supabase_presentation/features/step2/repositories/step2_post_repository.dart';
import 'package:supabase_presentation/features/step3/bloc/step3_post_bloc.dart';
import 'package:supabase_presentation/features/step3/repositories/step3_post_repository.dart';

const String kSupabaseUrl = 'https://iherhiqrhhrznzjsxmdf.supabase.co';
const String kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImloZXJoaXFyaGhyem56anN4bWRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjgxMjEzMDMsImV4cCI6MTk4MzY5NzMwM30.mDYJR56Hyo-byNtOljWpZ3fxoUlTsos7NLU-Ai3Q_vQ';

Future<void> init() async {
  await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseAnonKey);
}

void main() async {
  await init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AuthenticationBloc(
                authenticationRepository: AuthenticationRepository())),
        BlocProvider(
          create: (_) =>
              Step2PostBloc(step2postRepository: Step2PostRepository()),
        ),
        BlocProvider(
          create: (_) =>
              Step3PostBloc(step3postRepository: Step3PostRepository()),
        )
      ],
      child: MaterialApp(
        title: 'Development with Supabase in Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
