import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/models/notice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'notice_page_controller.freezed.dart';

@freezed
class NoticeState with _$NoticeState {
  const factory NoticeState(
      {@Default(<Notice>[]) List<Notice> notices,
      @Default('') String version}) = _NoticeState;
}

final noticePageProvider =
    StateNotifierProvider<NoticeStateController, NoticeState>(
        (ref) => NoticeStateController(ref.read));

class NoticeStateController extends StateNotifier<NoticeState> {
  final Reader _read;

  NoticeStateController(this._read) : super(const NoticeState()) {
    fetch();
    getVersion();
  }

  Future<void> fetch() async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('notice')
        .orderBy('created', descending: true)
        .get();
    final notices =
        snap.docs.map((doc) => Notice.fromJson(doc.data())).toList();
    state = state.copyWith(notices: notices);
  }

  Future<void> getVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    state = state.copyWith(version: packageInfo.version);
  }
}
