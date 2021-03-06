import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/models/like.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final likeButtonRepositoryProvider =
    Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);

  Future<List<UserModel>> fetch(
      {required String myId, required String itemId}) async {
    final uidList = [''];
    List<UserModel> userList = [];

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .doc(itemId)
        .collection('like')
        .limit(7)
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                uidList.add(doc.data()['uid']);
              })
            });

    for (var uid in uidList) {
      final snap = await _read(firebaseFirestoreProvider)
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();
      userList.addAll(
          snap.docs.map((doc) => UserModel.fromJson(doc.data())).toList());
    }

    return userList;
  }

  Future<List<Like>> fetchMyState(
      {required String myId, required String itemId}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .doc(itemId)
        .collection('like')
        .where('uid', isEqualTo: myId)
        .get();

    return snap.docs.map((doc) => Like.fromJson(doc.data())).toList();
  }

  Future<void> add({required String itemId, required String myId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .doc(itemId)
        .collection('like')
        .add({'uid': myId, 'clothesId': itemId});
  }

  Future<void> delete({
    required String itemId,
    required String myId,
  }) async {
    var snap = await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .doc(itemId)
        .collection('like')
        .where('uid', isEqualTo: myId)
        .get();
    for (var doc in snap.docs) {
      await doc.reference.delete();
    }
  }
}
