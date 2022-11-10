part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class NotLoggedIn extends AuthenticationState {}

class WaitLoggingIn extends AuthenticationState {}

class WaitRegistering extends AuthenticationState {}

class LoggedIn extends AuthenticationState {
  final User user;

  const LoggedIn({required this.user});

  @override
  List<Object> get props => [user];
}

class LoggingInFailed extends AuthenticationState {}
