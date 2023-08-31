import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthBloc(this._firebaseAuth) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState(event.user);
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        yield AuthAuthenticated(currentUser);
      } else {
        yield AuthUnauthenticated();
      }
    } catch (e) {
      yield AuthError(e.toString());
    }
  }

  Stream<AuthState> _mapLoggedInToState(User user) async* {
    yield AuthAuthenticated(user);
  }

  Stream<AuthState> _mapLoggedOutToState() async* {
    await _firebaseAuth.signOut();
    yield AuthUnauthenticated();
  }
}
