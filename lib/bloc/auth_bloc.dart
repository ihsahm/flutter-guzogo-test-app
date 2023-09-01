import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/cubits/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;
  final SharedPreferences _sharedPreferences;

  AuthBloc({
    required UserRepository userRepository,
    required SharedPreferences sharedPreferences,
  })  : _userRepository = userRepository,
        _sharedPreferences = sharedPreferences,
        super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState(event);
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      final isLoggedIn = _sharedPreferences.getBool('logged_in') ?? false;
      if (isLoggedIn) {
        final userId = _sharedPreferences.getString('user_id');
        final userEmail = _sharedPreferences.getString('user_email');
        if (userId != null && userEmail != null) {
          final user = User(id: userId, email: userEmail);
          yield AuthAuthenticated(user: user);
        }
      } else {
        yield AuthUnauthenticated();
      }
    } catch (e) {
      yield AuthUnauthenticated();
    }
  }

  Stream<AuthState> _mapLoggedInToState(LoggedIn event) async* {
    try {
      final user = await _userRepository.signInWithEmailAndPassword(
          event.email, event.password);
      if (user != null) {
        _sharedPreferences.setBool('logged_in', true);
        _sharedPreferences.setString('user_id', user.id);
        _sharedPreferences.setString('user_email', user.email);
        yield AuthAuthenticated(user: user);
      } else {
        yield AuthUnauthenticated();
      }
    } catch (e) {
      print('Error logging in: $e');
      yield AuthUnauthenticated();
    }
  }

  Stream<AuthState> _mapLoggedOutToState() async* {
    try {
      await _userRepository.signOut();
      _sharedPreferences.setBool('logged_in', false);
      _sharedPreferences.remove('user_id');
      _sharedPreferences.remove('user_email');
      yield AuthUnauthenticated();
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}
