// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'daily_content_instance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyContentInstance _$DailyContentInstanceFromJson(Map<String, dynamic> json) {
  return _DailyContentInstance.fromJson(json);
}

/// @nodoc
class _$DailyContentInstanceTearOff {
  const _$DailyContentInstanceTearOff();

  _DailyContentInstance call(
      {required String dailyContentInstanceId,
      required String dailyContentId,
      required Item item,
      @TimestampConverter() required DateTime date}) {
    return _DailyContentInstance(
      dailyContentInstanceId: dailyContentInstanceId,
      dailyContentId: dailyContentId,
      item: item,
      date: date,
    );
  }

  DailyContentInstance fromJson(Map<String, Object?> json) {
    return DailyContentInstance.fromJson(json);
  }
}

/// @nodoc
const $DailyContentInstance = _$DailyContentInstanceTearOff();

/// @nodoc
mixin _$DailyContentInstance {
  String get dailyContentInstanceId => throw _privateConstructorUsedError;
  String get dailyContentId => throw _privateConstructorUsedError;
  Item get item => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyContentInstanceCopyWith<DailyContentInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyContentInstanceCopyWith<$Res> {
  factory $DailyContentInstanceCopyWith(DailyContentInstance value,
          $Res Function(DailyContentInstance) then) =
      _$DailyContentInstanceCopyWithImpl<$Res>;
  $Res call(
      {String dailyContentInstanceId,
      String dailyContentId,
      Item item,
      @TimestampConverter() DateTime date});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$DailyContentInstanceCopyWithImpl<$Res>
    implements $DailyContentInstanceCopyWith<$Res> {
  _$DailyContentInstanceCopyWithImpl(this._value, this._then);

  final DailyContentInstance _value;
  // ignore: unused_field
  final $Res Function(DailyContentInstance) _then;

  @override
  $Res call({
    Object? dailyContentInstanceId = freezed,
    Object? dailyContentId = freezed,
    Object? item = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      dailyContentInstanceId: dailyContentInstanceId == freezed
          ? _value.dailyContentInstanceId
          : dailyContentInstanceId // ignore: cast_nullable_to_non_nullable
              as String,
      dailyContentId: dailyContentId == freezed
          ? _value.dailyContentId
          : dailyContentId // ignore: cast_nullable_to_non_nullable
              as String,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
abstract class _$DailyContentInstanceCopyWith<$Res>
    implements $DailyContentInstanceCopyWith<$Res> {
  factory _$DailyContentInstanceCopyWith(_DailyContentInstance value,
          $Res Function(_DailyContentInstance) then) =
      __$DailyContentInstanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String dailyContentInstanceId,
      String dailyContentId,
      Item item,
      @TimestampConverter() DateTime date});

  @override
  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$DailyContentInstanceCopyWithImpl<$Res>
    extends _$DailyContentInstanceCopyWithImpl<$Res>
    implements _$DailyContentInstanceCopyWith<$Res> {
  __$DailyContentInstanceCopyWithImpl(
      _DailyContentInstance _value, $Res Function(_DailyContentInstance) _then)
      : super(_value, (v) => _then(v as _DailyContentInstance));

  @override
  _DailyContentInstance get _value => super._value as _DailyContentInstance;

  @override
  $Res call({
    Object? dailyContentInstanceId = freezed,
    Object? dailyContentId = freezed,
    Object? item = freezed,
    Object? date = freezed,
  }) {
    return _then(_DailyContentInstance(
      dailyContentInstanceId: dailyContentInstanceId == freezed
          ? _value.dailyContentInstanceId
          : dailyContentInstanceId // ignore: cast_nullable_to_non_nullable
              as String,
      dailyContentId: dailyContentId == freezed
          ? _value.dailyContentId
          : dailyContentId // ignore: cast_nullable_to_non_nullable
              as String,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DailyContentInstance implements _DailyContentInstance {
  _$_DailyContentInstance(
      {required this.dailyContentInstanceId,
      required this.dailyContentId,
      required this.item,
      @TimestampConverter() required this.date});

  factory _$_DailyContentInstance.fromJson(Map<String, dynamic> json) =>
      _$$_DailyContentInstanceFromJson(json);

  @override
  final String dailyContentInstanceId;
  @override
  final String dailyContentId;
  @override
  final Item item;
  @override
  @TimestampConverter()
  final DateTime date;

  @override
  String toString() {
    return 'DailyContentInstance(dailyContentInstanceId: $dailyContentInstanceId, dailyContentId: $dailyContentId, item: $item, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyContentInstance &&
            const DeepCollectionEquality()
                .equals(other.dailyContentInstanceId, dailyContentInstanceId) &&
            const DeepCollectionEquality()
                .equals(other.dailyContentId, dailyContentId) &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dailyContentInstanceId),
      const DeepCollectionEquality().hash(dailyContentId),
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$DailyContentInstanceCopyWith<_DailyContentInstance> get copyWith =>
      __$DailyContentInstanceCopyWithImpl<_DailyContentInstance>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyContentInstanceToJson(this);
  }
}

abstract class _DailyContentInstance implements DailyContentInstance {
  factory _DailyContentInstance(
      {required String dailyContentInstanceId,
      required String dailyContentId,
      required Item item,
      @TimestampConverter() required DateTime date}) = _$_DailyContentInstance;

  factory _DailyContentInstance.fromJson(Map<String, dynamic> json) =
      _$_DailyContentInstance.fromJson;

  @override
  String get dailyContentInstanceId;
  @override
  String get dailyContentId;
  @override
  Item get item;
  @override
  @TimestampConverter()
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$DailyContentInstanceCopyWith<_DailyContentInstance> get copyWith =>
      throw _privateConstructorUsedError;
}
