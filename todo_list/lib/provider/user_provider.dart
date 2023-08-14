import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/models/user.dart';

class UserNotifier extends StateNotifier<List<User>> {
  UserNotifier() : super([]);

  void addUser(User user) {
    state = [...state, user];
  }

  void deleteUser(User user) {
    state = state.where((u) => user.id != user.id).toList();
  }

  void replceUserList(List<User> userList) {
    state = userList;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, List<User>>(
  (ref) => UserNotifier(),
);
