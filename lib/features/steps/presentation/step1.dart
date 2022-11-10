import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_presentation/features/authentication/bloc/authentication_bloc.dart';
import 'package:supabase_presentation/features/authentication/presentation/pages/login_page.dart';
import 'package:supabase_presentation/features/authentication/presentation/pages/register_page.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  bool _isRegister = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is NotLoggedIn) {
          if (_isRegister) {
            return RegisterPage(
              toLoginFunc: () {
                setState(() {
                  _isRegister = false;
                });
              },
            );
          } else {
            return LoginPage(toRegisterFunc: () {
              setState(() {
                _isRegister = true;
              });
            });
          }
        } else if (state is LoggedIn) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Logged In', textAlign: TextAlign.center),
                const SizedBox(height: 32),
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(Logout());
                    },
                    child: const Text('Logout'))
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
