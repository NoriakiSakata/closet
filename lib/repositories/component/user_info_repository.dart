import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoRepositoryProvider =
    Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);

  Future<UserModel> fetch({required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore.collection('users').doc(userId).get();
    final data = snap.data();
    if (data == null) {
      return UserModel();
    }
    return UserModel.fromJson(data);
  }
}
