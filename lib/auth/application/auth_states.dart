import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../infrastructure/authenticator.dart';
import 'auth_notifier.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._authenticator) : super(const AuthState.initial());

  final Authenticator _authenticator;

  Future<void> checkAndUpdateAuthStatus() =>
      _authenticator.getSignedInUser().then(
        (user) {
          if (user != null) {
            state = AuthState.authenticated(user);
          } else {
            state = const AuthState.unauthenticated();
          }
        },
      );

  Future<void> signIn(String email, String password) async {
    state = const AuthState.loading();

    final failureOrSuccess = await _authenticator.signIn(email, password);

    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => AuthState.authenticated(r.user),
    );
  }

  Future<void> signOut() async {
    final failureOrSuccess = await _authenticator.signOut();

    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.unauthenticated(),
    );
  }
}
