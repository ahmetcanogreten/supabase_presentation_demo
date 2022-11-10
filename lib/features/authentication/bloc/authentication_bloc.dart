import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthenticationRepository _authenticationRepository;

  User? loggedInUser;

  AuthenticationBloc(
      {required IAuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(NotLoggedIn()) {
    on<Register>((event, emit) async {
      emit(WaitRegistering());

      final email = event.email;
      final password = event.password;

      try {
        final user = await _authenticationRepository.signUp(
            email: email, password: password);

        if (user != null) {
          loggedInUser = user;

          emit(LoggedIn(user: user));
        } else {
          emit(NotLoggedIn());
        }
      } catch (e) {
        emit(NotLoggedIn());
      }
    });

    on<Login>((event, emit) async {
      emit(WaitLoggingIn());

      final email = event.email;
      final password = event.password;

      try {
        final user = await _authenticationRepository.signIn(
            email: email, password: password);

        if (user != null) {
          loggedInUser = user;

          emit(LoggedIn(user: user));
        } else {
          emit(NotLoggedIn());
        }
      } catch (e) {
        emit(NotLoggedIn());
      }
    });

    on<Logout>((event, emit) async {
      await _authenticationRepository.logout();
      emit(NotLoggedIn());
    });
  }
}
