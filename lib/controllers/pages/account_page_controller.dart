import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/clothes.dart';
import '../../repositories/clothes_repository.dart';
import '../../repositories/follow_page_repository.dart';
import '../../repositories/follower_page_repository.dart';

part 'account_page_controller.freezed.dart';

@freezed
class AccountPageState with _$AccountPageState {
  const AccountPageState._();

  const factory AccountPageState({
    @Default(<Clothes>[]) List<Clothes> closet,
    @Default(<Clothes>[]) List<Clothes> closetFavorite,
    @Default('') String buying,
    @Default('') String selling,
    @Default('') String follow,
    @Default('') String follower,
    @Default(UserModel()) UserModel user,
    @Default(false) bool isMenu,
  }) = _AccountPageState;
}

class AccountPageProviderArg {
  AccountPageProviderArg({required this.userId});
  final String userId;
}

final accountPageProvider =
    StateNotifierProvider.autoDispose<AccountPageController, AccountPageState>(
        (ref) {
  return throw UnimplementedError();
});

final accountPageProviderFamily = StateNotifierProvider.family.autoDispose<
    AccountPageController,
    AccountPageState,
    AccountPageProviderArg>((ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return AccountPageController(ref.read, userId: arg.userId, user: user);
});

class AccountPageController extends StateNotifier<AccountPageState> {
  AccountPageController(this._read,
      {required String userId, required UserModel user})
      : _userId = userId,
        _user = user,
        super(const AccountPageState()) {
    _init();
  }
  final String _userId;
  final Reader _read;
  final UserModel _user;

  Future<void> _init() async {
    fetchAccountPageData();
  }

  Future<void> fetchAccountPageData() async {
    final List<Clothes> closet = await _read(clothesRepositoryProvider)
        .fetchClosetRecent(isSell: false, userId: _userId);
    final List<Clothes> closetFavorite =
        await _read(clothesRepositoryProvider).fetchFavorite(
      isSell: false,
      userId: _userId,
    );
    final buying = await _read(clothesRepositoryProvider).fetchBuyingAll(
      userId: _userId,
    );
    final selling = await _read(clothesRepositoryProvider).fetchSellingAll(
      userId: _userId,
    );
    final follow = await _read(followRepositoryProvider).fetch(
      userId: _userId,
    );
    final follower = await _read(followerRepositoryProvider).fetch(
      userId: _userId,
    );
    final user = await _read(userRepositoryProvider).fetchUser(userId: _userId);
    if (user != null) {
      state = state.copyWith(
          closet: closet,
          closetFavorite: closetFavorite,
          buying: buying,
          selling: selling,
          follow: follow.length.toString(),
          follower: follower.length.toString(),
          user: user,
          isMenu: _user.uid == _userId ? true : false);
    }
  }
}
