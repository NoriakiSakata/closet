import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/libs/Firebase_providers.dart';
import '../models/user.dart';




final followerRepositoryProvider = Provider<followerRepository>((ref) => followerRepository(ref.read));

class followerRepository {
  final Reader _read;

  const followerRepository(this._read);

  Future<List<UserModel>> fetch({required String userId}) async {

    final uidList = [''];

    await _read(firebaseFirestoreProvider)
        .collection('users').doc(userId).collection('follower')
        .get().then((snapshot) => {
      snapshot.docs.forEach((doc) {
        uidList.add(doc.data()['uid']);
      })
    });

    final snap = await _read(firebaseFirestoreProvider)
        .collection('users')
        .where('uid', whereIn: uidList)
        .get();
    return snap.docs.map((doc) => UserModel.fromDocument(doc)).toList();
  }
}