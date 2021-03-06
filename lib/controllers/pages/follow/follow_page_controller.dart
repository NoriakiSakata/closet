import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/follow_page_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_page_controller.freezed.dart';

@freezed
class FollowPageState with _$FollowPageState {
  const FollowPageState._();

  const factory FollowPageState(
      {@Default(<UserModel>[]) List<UserModel> follows,
      @Default(false) bool isLoading
      }) = _FollowPageState;
}

class FollowPageProviderArg {
  FollowPageProviderArg({required this.userId});
  final String? userId;
}

final followPageProvider =
    StateNotifierProvider.autoDispose<FollowPageController, FollowPageState>(
        (ref) {
  return throw UnimplementedError();
});

final followPageProviderFamily = StateNotifierProvider.family
    .autoDispose<FollowPageController, FollowPageState, FollowPageProviderArg>(
        (ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return FollowPageController(
    ref.read,
    userId: arg.userId ?? user.uid,
  );
});

class FollowPageController extends StateNotifier<FollowPageState> {
  FollowPageController(
    this._read, {
    required String userId,
  })  : _userId = userId,
        super(const FollowPageState()) {
    _init();
  }
  final String _userId;
  final Reader _read;

  Future<void> _init() async {
    fetchFollows();
  }

  Future<void> fetchFollows() async {
    state = state.copyWith(isLoading: true);
    final List<UserModel> follows =
        await _read(followRepositoryProvider).fetch(userId: _userId);
    state = state.copyWith(follows: follows, isLoading: false);

  }
}
