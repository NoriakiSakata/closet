import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/libs/Firebase_providers.dart';
import '../models/clothes.dart';


final clothesViewPageRepositoryProvider = Provider<Repository>((ref) => Repository(ref.read));

class Repository {
  final Reader _read;

  const Repository(this._read);

  Future<Clothes> fetchFavorite({ required String userId, required String itemId}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection("users").doc(userId)
        .collection('clothes').doc(itemId).get()
        .then((DocumentSnapshot<Map<String, dynamic>> doc) {
      return Clothes.fromDocument(doc);
    });
    return snap;
  }

  Future<void> updateFavoriteTrue({ required String userId, required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection("users").doc(userId)
        .collection('clothes').doc(itemId)
        .update({
      'isFavorite' : true
    });

  }
  Future<void> updateFavoriteFalse({ required String userId, required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection("users").doc(userId)
        .collection('clothes').doc(itemId)
        .update({
      'isFavorite' : false
    });

  }
}