// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'closet_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ClosetPageStateTearOff {
  const _$ClosetPageStateTearOff();

  _ClosetPageState call(
      {List<Clothes> closet = const <Clothes>[],
      List<Clothes> closetFavorite = const <Clothes>[],
      String buying = '',
      String selling = '',
      String year = '',
      String month = '',
      bool isSell = false,
      String category = 'ALL',
      UserModel user = const UserModel(),
      bool isLoading = false,
      bool isAddClothes = false}) {
    return _ClosetPageState(
      closet: closet,
      closetFavorite: closetFavorite,
      buying: buying,
      selling: selling,
      year: year,
      month: month,
      isSell: isSell,
      category: category,
      user: user,
      isLoading: isLoading,
      isAddClothes: isAddClothes,
    );
  }
}

/// @nodoc
const $ClosetPageState = _$ClosetPageStateTearOff();

/// @nodoc
mixin _$ClosetPageState {
  List<Clothes> get closet => throw _privateConstructorUsedError;
  List<Clothes> get closetFavorite => throw _privateConstructorUsedError;
  String get buying => throw _privateConstructorUsedError;
  String get selling => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  bool get isSell => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAddClothes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClosetPageStateCopyWith<ClosetPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosetPageStateCopyWith<$Res> {
  factory $ClosetPageStateCopyWith(
          ClosetPageState value, $Res Function(ClosetPageState) then) =
      _$ClosetPageStateCopyWithImpl<$Res>;
  $Res call(
      {List<Clothes> closet,
      List<Clothes> closetFavorite,
      String buying,
      String selling,
      String year,
      String month,
      bool isSell,
      String category,
      UserModel user,
      bool isLoading,
      bool isAddClothes});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$ClosetPageStateCopyWithImpl<$Res>
    implements $ClosetPageStateCopyWith<$Res> {
  _$ClosetPageStateCopyWithImpl(this._value, this._then);

  final ClosetPageState _value;
  // ignore: unused_field
  final $Res Function(ClosetPageState) _then;

  @override
  $Res call({
    Object? closet = freezed,
    Object? closetFavorite = freezed,
    Object? buying = freezed,
    Object? selling = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? isSell = freezed,
    Object? category = freezed,
    Object? user = freezed,
    Object? isLoading = freezed,
    Object? isAddClothes = freezed,
  }) {
    return _then(_value.copyWith(
      closet: closet == freezed
          ? _value.closet
          : closet // ignore: cast_nullable_to_non_nullable
              as List<Clothes>,
      closetFavorite: closetFavorite == freezed
          ? _value.closetFavorite
          : closetFavorite // ignore: cast_nullable_to_non_nullable
              as List<Clothes>,
      buying: buying == freezed
          ? _value.buying
          : buying // ignore: cast_nullable_to_non_nullable
              as String,
      selling: selling == freezed
          ? _value.selling
          : selling // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      isSell: isSell == freezed
          ? _value.isSell
          : isSell // ignore: cast_nullable_to_non_nullable
              as bool,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddClothes: isAddClothes == freezed
          ? _value.isAddClothes
          : isAddClothes // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$ClosetPageStateCopyWith<$Res>
    implements $ClosetPageStateCopyWith<$Res> {
  factory _$ClosetPageStateCopyWith(
          _ClosetPageState value, $Res Function(_ClosetPageState) then) =
      __$ClosetPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Clothes> closet,
      List<Clothes> closetFavorite,
      String buying,
      String selling,
      String year,
      String month,
      bool isSell,
      String category,
      UserModel user,
      bool isLoading,
      bool isAddClothes});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$ClosetPageStateCopyWithImpl<$Res>
    extends _$ClosetPageStateCopyWithImpl<$Res>
    implements _$ClosetPageStateCopyWith<$Res> {
  __$ClosetPageStateCopyWithImpl(
      _ClosetPageState _value, $Res Function(_ClosetPageState) _then)
      : super(_value, (v) => _then(v as _ClosetPageState));

  @override
  _ClosetPageState get _value => super._value as _ClosetPageState;

  @override
  $Res call({
    Object? closet = freezed,
    Object? closetFavorite = freezed,
    Object? buying = freezed,
    Object? selling = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? isSell = freezed,
    Object? category = freezed,
    Object? user = freezed,
    Object? isLoading = freezed,
    Object? isAddClothes = freezed,
  }) {
    return _then(_ClosetPageState(
      closet: closet == freezed
          ? _value.closet
          : closet // ignore: cast_nullable_to_non_nullable
              as List<Clothes>,
      closetFavorite: closetFavorite == freezed
          ? _value.closetFavorite
          : closetFavorite // ignore: cast_nullable_to_non_nullable
              as List<Clothes>,
      buying: buying == freezed
          ? _value.buying
          : buying // ignore: cast_nullable_to_non_nullable
              as String,
      selling: selling == freezed
          ? _value.selling
          : selling // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      isSell: isSell == freezed
          ? _value.isSell
          : isSell // ignore: cast_nullable_to_non_nullable
              as bool,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddClothes: isAddClothes == freezed
          ? _value.isAddClothes
          : isAddClothes // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ClosetPageState extends _ClosetPageState with DiagnosticableTreeMixin {
  const _$_ClosetPageState(
      {this.closet = const <Clothes>[],
      this.closetFavorite = const <Clothes>[],
      this.buying = '',
      this.selling = '',
      this.year = '',
      this.month = '',
      this.isSell = false,
      this.category = 'ALL',
      this.user = const UserModel(),
      this.isLoading = false,
      this.isAddClothes = false})
      : super._();

  @JsonKey()
  @override
  final List<Clothes> closet;
  @JsonKey()
  @override
  final List<Clothes> closetFavorite;
  @JsonKey()
  @override
  final String buying;
  @JsonKey()
  @override
  final String selling;
  @JsonKey()
  @override
  final String year;
  @JsonKey()
  @override
  final String month;
  @JsonKey()
  @override
  final bool isSell;
  @JsonKey()
  @override
  final String category;
  @JsonKey()
  @override
  final UserModel user;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isAddClothes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClosetPageState(closet: $closet, closetFavorite: $closetFavorite, buying: $buying, selling: $selling, year: $year, month: $month, isSell: $isSell, category: $category, user: $user, isLoading: $isLoading, isAddClothes: $isAddClothes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClosetPageState'))
      ..add(DiagnosticsProperty('closet', closet))
      ..add(DiagnosticsProperty('closetFavorite', closetFavorite))
      ..add(DiagnosticsProperty('buying', buying))
      ..add(DiagnosticsProperty('selling', selling))
      ..add(DiagnosticsProperty('year', year))
      ..add(DiagnosticsProperty('month', month))
      ..add(DiagnosticsProperty('isSell', isSell))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isAddClothes', isAddClothes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClosetPageState &&
            const DeepCollectionEquality().equals(other.closet, closet) &&
            const DeepCollectionEquality()
                .equals(other.closetFavorite, closetFavorite) &&
            const DeepCollectionEquality().equals(other.buying, buying) &&
            const DeepCollectionEquality().equals(other.selling, selling) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.isSell, isSell) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isAddClothes, isAddClothes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(closet),
      const DeepCollectionEquality().hash(closetFavorite),
      const DeepCollectionEquality().hash(buying),
      const DeepCollectionEquality().hash(selling),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(isSell),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isAddClothes));

  @JsonKey(ignore: true)
  @override
  _$ClosetPageStateCopyWith<_ClosetPageState> get copyWith =>
      __$ClosetPageStateCopyWithImpl<_ClosetPageState>(this, _$identity);
}

abstract class _ClosetPageState extends ClosetPageState {
  const factory _ClosetPageState(
      {List<Clothes> closet,
      List<Clothes> closetFavorite,
      String buying,
      String selling,
      String year,
      String month,
      bool isSell,
      String category,
      UserModel user,
      bool isLoading,
      bool isAddClothes}) = _$_ClosetPageState;
  const _ClosetPageState._() : super._();

  @override
  List<Clothes> get closet;
  @override
  List<Clothes> get closetFavorite;
  @override
  String get buying;
  @override
  String get selling;
  @override
  String get year;
  @override
  String get month;
  @override
  bool get isSell;
  @override
  String get category;
  @override
  UserModel get user;
  @override
  bool get isLoading;
  @override
  bool get isAddClothes;
  @override
  @JsonKey(ignore: true)
  _$ClosetPageStateCopyWith<_ClosetPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
