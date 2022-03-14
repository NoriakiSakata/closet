import 'dart:io';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../global/user_controller.dart';

part 'account_edit_page_controller.freezed.dart';

@freezed
class AccountEditPageState with _$AccountEditPageState {
  const AccountEditPageState._();

  const factory AccountEditPageState({
    File? imageFile,
    @Default('') String image,
    @Default('') String id,
    @Default('') String name,
  }) = _AccountEditPageState;
}






final AccountEditPageProvider =
StateNotifierProvider.autoDispose<AccountEditPageController, AccountEditPageState>(
        (ref) {
      final user = ref.watch(userProvider.select((value) => value.user));
      return AccountEditPageController(ref.read, user: user);
    });




class AccountEditPageController extends StateNotifier<AccountEditPageState> {
  AccountEditPageController(this._read, {required UserModel user})
      : _user = user,
        super(AccountEditPageState());

  final Reader _read;
  final UserModel _user;


  Future<void> imageFile(XFile? imageFile) async {
    if (imageFile == null) {
      return;
    }
    state = await state.copyWith(imageFile: File(imageFile.path));
    state = state.copyWith(
        image: await _uploadImageFile(state.imageFile));
  }

  Future<void> name({required String name}) async {
    state = state.copyWith(name: name);
  }

  Future<void> id({required String id}) async {
    state = state.copyWith(id: id);
  }

  Future<String> _uploadImageFile(imageFile) async {
    final String userId = _user.uid;
    final Uuid uuid = const Uuid();

    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userId/${uuid.v4()}")
        .putFile(imageFile);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  Future<void> updateUser() async {
    final user = UserModel(
      image: state.image == '' ? _user.image : state.image,
      name: state.name == '' ? _user.name : state.name,
      id: state.id == '' ? _user.id : state.id,
      uid: _user.uid
    );

    await _read(userRepositoryProvider).update(user: user);
  }
}
