import 'package:closet_app_xxx/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/follow.dart';
import '../models/libs/Firebase_providers.dart';

final followButtonRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository {
  final  Reader _read;

  const _ItemRepository(this._read);



  Future<List<Follow>> fetchMyFollow({ required String myId,  required String yourId}) async {

      final snap = await _read(firebaseFirestoreProvider)
          .collection('users').doc(myId).collection("follow").where('uid',isEqualTo: yourId)
          .get();
      return snap.docs.map((doc) => Follow.fromDocument(doc)).toList();
  }

  Future<List<Follow>> fetchYourFollower({ required String myId,  required String yourId}) async {

    final snap = await _read(firebaseFirestoreProvider)
        .collection('users').doc(yourId).collection("follower").where('uid',isEqualTo: myId)
        .get();
    return snap.docs.map((doc) => Follow.fromDocument(doc)).toList();
  }


  Future<void> add({required String yourId, required String myId}) async {

      await _read(firebaseFirestoreProvider)
          .collection('users').doc(yourId).collection('follower')
          .add({
        'uid' : myId
      });
      await _read(firebaseFirestoreProvider)
          .collection('users').doc(myId).collection('follow')
          .add({
        'uid' : yourId});
  }


  Future<void> delete({required String yourId, required String myId, }) async {


      var follow =
      await _read(firebaseFirestoreProvider)
          .collection('users').doc(myId).collection('follow')
          .where('uid', isEqualTo: yourId).get();
      for (var doc in follow.docs) {
        await doc.reference.delete();
      }

      var follower =
      await _read(firebaseFirestoreProvider)
          .collection('users').doc(yourId).collection('follower')
          .where('uid', isEqualTo: myId).get();
      for (var doc in follower.docs) {
        await doc.reference.delete();
      }

  }
}