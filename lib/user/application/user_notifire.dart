import 'package:hooks_riverpod/hooks_riverpod.dart';
import "user_states.dart";
import '../infrastructure/repository/user_repository.dart';

class UserStateNotifier extends StateNotifier<UserState> {
  final UserRepository _userRepository;

  UserStateNotifier(this._userRepository) : super(const UserState.initial());
}
