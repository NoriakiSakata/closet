
import 'package:closet_app_xxx/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../models/media.dart';
import '../../repositories/media_page_repository.dart';
import '../global/user_controller.dart';

part 'media_edit_page_controller.freezed.dart';

@freezed
class MediaEditPageState with _$MediaEditPageState {
  const MediaEditPageState._();

  const factory MediaEditPageState({
    File? imageFile,
    @Default('') String image,
    @Default('') String url,
    @Default('') String name,
  }) = _MediaEditPageState;
}


final MediaEditPageProvider =
StateNotifierProvider.autoDispose<MediaEditPageController, MediaEditPageState>(
        (ref) {
      final user = ref.watch(userProvider.select((value) => value.user));
      return MediaEditPageController(ref.read, user: user);
    });




class MediaEditPageController extends StateNotifier<MediaEditPageState> {
  MediaEditPageController(this._read, {required UserModel user})
      : user = user, super(MediaEditPageState());

  final Reader _read;
  final UserModel user;


  Future<void> imageFile(XFile? imageFile) async {
    if (imageFile == null) {
      return;
    }
    state = await state.copyWith(imageFile: File(imageFile.path));
    state = state.copyWith(
        image: await _uploadImageFile(state.imageFile));
  }

  Future<void> name({required String name})async{
    state = state.copyWith(name: name);
  }

  Future<void> url({required String url})async{
    state = state.copyWith(name: url);
  }

  Future<String> _uploadImageFile(imageFile) async {
    final Uuid uuid = const Uuid();
    final userEmail = user.email;

    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userEmail/${uuid.v4()}")
        .putFile(imageFile);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  Future<void> updateMedia({required Media media}) async {
    final _media = Media(
        itemId: media.itemId,
        image: state.imageFile != null ? state.image: media.image,
        name: state.name != '' ? state.name: media.name,
        url: state.url != '' ? state.url: media.url
    );

    await _read(mediaRepositoryProvider).update(userId: user.uid, media: _media);
  }
}


