import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/libs/Firebase_providers.dart';
import '../models/user.dart';




final followRepositoryProvider = Provider<followRepository>((ref) => followRepository(ref.read));

class followRepository {
  final Reader _read;

  const followRepository(this._read);

  Future<List<UserModel>> fetch({required String userId}) async {

      final uidList = [''];

      await _read(firebaseFirestoreProvider)
          .collection('users').doc(userId).collection('follow')
          .get().then((snapshot) => {
        snapshot.docs.forEach((doc) {
          uidList.add(doc.data()['uid']);
        })
      });

      final snap = await _read(firebaseFirestoreProvider)
          .collection('users')
          .where('uid', whereIn: uidList)
          .get();
      return snap.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
  }
}