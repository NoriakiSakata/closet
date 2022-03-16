import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/clothes_for_public.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/buy.dart';
import '../models/libs/Firebase_providers.dart';
import '../models/sell.dart';
import '../models/user.dart';

final clothesRepositoryProvider = Provider<_Repository>((ref) => _Repository(ref.read));

class _Repository {
  final Reader _read;

  _Repository(this._read);

  Future<List<Clothes>> fetchCloset(
      {required String userId, required bool isSell, required String category}) async {
    final snap = category == 'ALL' ?
    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('isSell', isEqualTo: isSell).where('uid', isEqualTo: userId)
        .get() :
    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('isSell', isEqualTo: isSell).where(
        'category', isEqualTo: category).where('uid', isEqualTo: userId).get();


    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }


  Future<List<Clothes>> fetchFavorite(
      {required String userId, required bool isSell}) async {
    final snap =
    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('isSell', isEqualTo: isSell)
        .where('isFavorite', isEqualTo: true)
        .where('uid', isEqualTo: userId)
        .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }



  Future<String> fetchBuying(
      {required String userId, required String month, required String year}) async {
    List<String> list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .where('uid', isEqualTo: userId).get()
        .then((snapshot) =>
    {
      snapshot.docs.forEach((doc) {
        list.add(doc.data()['price']);
      })
    });

    if (list.isNotEmpty) {
      sum = list.map<double>((clothes) => double.parse(clothes)).reduce((curr,
          next) => curr + next);
    }
    return sum.floor().toString();
  }

  Future<String> fetchBuyingAll(
      {required String userId,}) async {
    List<String> list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('uid', isEqualTo: userId).get()
        .then((snapshot) =>
    {
      snapshot.docs.forEach((doc) {
        list.add(doc.data()['price']);
      })
    });

    if (list.isNotEmpty) {
      sum = list.map<double>((clothes) => double.parse(clothes)).reduce((curr,
          next) => curr + next);
    }
    return sum.floor().toString();
  }




  Future<String> fetchSelling(
      {required String userId, required String month, required String year}) async {
    List list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('sellingYear', isEqualTo: year).where(
        'sellingMonth', isEqualTo: month)
        .where('isSell', isEqualTo: true).where('uid', isEqualTo: userId)
        .get()
        .then((snapshot) =>
    {
      snapshot.docs.forEach((doc) {
        list.add(doc.data()['selling']);
      })
    });
    if (list.isNotEmpty) {
      sum = list.map<double>((clothes) => double.parse(clothes)).reduce((curr,
          next) => curr + next);
    }

    return sum.floor().toString();
  }

  Future<String> fetchSellingAll(
      {required String userId}) async {
    List list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('isSell', isEqualTo: true).where('uid', isEqualTo: userId)
        .get()
        .then((snapshot) =>
    {
      snapshot.docs.forEach((doc) {
        list.add(doc.data()['selling']);
      })
    });
    if (list.isNotEmpty) {
      sum = list.map<double>((clothes) => double.parse(clothes)).reduce((curr,
          next) => curr + next);
    }

    return sum.floor().toString();
  }


  Future<List<Clothes>> fetchSortBuyCloset(
      {required String userId, required String year, required String month}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection('clothes')
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .where('uid', isEqualTo: userId)
        .get();
    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }


  Future<List<Clothes>> fetchSortSellCloset(
      {required String userId, required String year, required String month}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection('clothes')
        .where('sellingYear', isEqualTo: year)
        .where('sellingMonth', isEqualTo: month)
        .where('isSell', isEqualTo: true)
        .where('uid', isEqualTo: userId).get();
    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }



  Future<void> add({required Buy clothes, required UserModel user}) async {
    final ref = await _read(firebaseFirestoreProvider)
        .collection('clothes');
    final id = ref
        .doc()
        .id;
    await ref.doc(id).set(<String, dynamic>{
      ...clothes.toJson(),
      'itemId': id,
      'createdBuy': Timestamp.fromDate(clothes.createdBuy),
    });
  }

  Future<void> sell({required Sell clothes, required String userId,}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes').doc(clothes.itemId).update({
      'isSell': clothes.isSell,
      'selling': clothes.selling,
      'sellingDay': clothes.sellingDay,
      'sellingMonth': clothes.sellingMonth,
      'sellingYear': clothes.sellingYear,
      'createdSell': Timestamp.fromDate(clothes.createdSell)
    });
  }

  Future<void> delete({required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes').doc(itemId)
        .delete();
  }

  Future<void> update(
      {required ClothesForPublic clothes}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore
        .collection('clothes').doc(clothes.itemId).update
      ({
      "brands": clothes.brands,
      "description": clothes.description,
      "category": clothes.category,
      "price": clothes.price,
      "year": clothes.year,
      "day": clothes.day,
      "month": clothes.month,
      "selling": clothes.selling,
      "sellingYear": clothes.sellingYear,
      "sellingMonth": clothes.sellingMonth,
      "sellingDay": clothes.sellingDay,
    });
  }



  Future<void> updateFavoriteTrue({required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes').doc(itemId)
        .update({
      'isFavorite' : true
    });

  }
  Future<void> updateFavoriteFalse({required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes').doc(itemId)
        .update({
      'isFavorite' : false
    });
  }
}