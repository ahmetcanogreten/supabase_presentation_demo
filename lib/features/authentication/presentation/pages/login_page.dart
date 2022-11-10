import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_presentation/features/authentication/bloc/authentication_bloc.dart';

class LoginPage extends StatefulWidget {
  final void Function() toRegisterFunc;
  const LoginPage({super.key, required this.toRegisterFunc});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isValidEmail(String text) {
    final emailRegExp = RegExp(
        r"""(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])""");
    return emailRegExp.hasMatch(text);
  }

  bool isValidPassword(password) {
    return password.length >= 8; // TODO: Improve this
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-Mail',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) => isValidEmail(value ?? '')
                          ? null
                          : 'E-Mail is not valid',
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      validator: (value) => isValidPassword(value)
                          ? null
                          : 'Password is not valid',
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: widget.toRegisterFunc,
                      child: Text('Not registered yet? Register',
                          textAlign: TextAlign.end,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthenticationBloc>(context).add(
                              Login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          }
                        },
                        child: const Text('Login'))
                  ]),
            ),
          ),
        );
      },
    );
  }
}
