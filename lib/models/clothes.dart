import 'package:closet_app_xxx/models/clothes_for_public.dart';
import 'package:closet_app_xxx/models/libs/timestamp_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes.freezed.dart';
part 'clothes.g.dart';

@freezed
class Clothes with _$Clothes {
  const Clothes._();

  const factory Clothes({
    @FireTimestampConverterNonNull()required DateTime createdBuy,
    @FireTimestampConverterNonNull()required DateTime createdSell,
    @Default('') String itemId,
    @Default('') String brands,
    @Default('') String price,
    @Default('') String category,
    @Default('') String imageURL,
    @Default('') String selling,
    @Default('') String description,
    @Default('') String day,
    @Default('') String month,
    @Default('') String year,
    @Default('') String sellingDay,
    @Default('') String sellingMonth,
    @Default('') String sellingYear,
    @Default(false)bool isSell,
    @Default(false)bool isFavorite,
    @Default('') String uid,
    @Default('') String userName,
    @Default('') String userImage
  }) = _Clothes;

  factory Clothes.fromJson(Map<String, dynamic> json) => _$ClothesFromJson(json);

  ClothesForPublic toClothesCreate() {
    return ClothesForPublic(
      itemId: itemId,
      brands: brands,
      price: price,
      category: category,
      imageURL: imageURL,
      selling: selling,
      description: description,
      day: day,
      month: month,
      year: year,
      sellingDay: sellingDay,
      sellingMonth: sellingMonth,
      sellingYear: sellingYear,
      isSell: isSell,
      isFavorite: isFavorite,
    );
  }

}


