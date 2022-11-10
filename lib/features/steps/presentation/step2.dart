import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_presentation/features/authentication/bloc/authentication_bloc.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is LoggedIn) {
          return const Center(child: Text('Step 2'));
        } else {}
        return const Center(child: Text('Not Logged In Yet'));
      },
    );
  }
}
