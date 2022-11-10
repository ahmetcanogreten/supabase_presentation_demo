// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:neosafeplus/router/app_router.dart';
// import 'package:neosafeplus/features/authentication/bloc/authentication_bloc.dart';

// const kSplashScreenDurationInSeconds = 1;

// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: kSplashScreenDurationInSeconds), () {
//       final state = context.read<AuthenticationBloc>().state;

//       if (state is LoggedIn) {
//         context.router.replace(const HomeRoute());
//       } else {
//         context.router.replace(const RegisterRoute());
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           'NeoSAFE+',
//           style: TextStyle(fontSize: 50),
//         ),
//       ),
//     );
//   }
// }
