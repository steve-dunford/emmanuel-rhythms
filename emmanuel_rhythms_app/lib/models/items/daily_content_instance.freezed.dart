// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_content_instance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyContentInstance _$DailyContentInstanceFromJson(Map<String, dynamic> json) {
  return _DailyContentInstance.fromJson(json);
}

/// @nodoc
mixin _$DailyContentInstance {
  String get dailyContentInstanceId => throw _privateConstructorUsedError;
  String get dailyContentId => throw _privateConstructorUsedError;
  Item get item => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this DailyContentInstance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyContentInstance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyContentInstanceCopyWith<DailyContentInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyContentInstanceCopyWith<$Res> {
  factory $DailyContentInstanceCopyWith(DailyContentInstance value,
          $Res Function(DailyContentInstance) then) =
      _$DailyContentInstanceCopyWithImpl<$Res, DailyContentInstance>;
  @useResult
  $Res call(
      {String dailyContentInstanceId,
      String dailyContentId,
      Item item,
      @TimestampConverter() DateTime date});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$DailyContentInstanceCopyWithImpl<$Res,
        $Val extends DailyContentInstance>
    implements $DailyContentInstanceCopyWith<$Res> {
  _$DailyContentInstanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyContentInstance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyContentInstanceId = null,
    Object? dailyContentId = null,
    Object? item = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      dailyContentInstanceId: null == dailyContentInstanceId
          ? _value.dailyContentInstanceId
          : dailyContentInstanceId // ignore: cast_nullable_to_non_nullable
              as String,
      dailyContentId: null == dailyContentId
          ? _value.dailyContentId
          : dailyContentId // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of DailyContentInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyContentInstanceImplCopyWith<$Res>
    implements $DailyContentInstanceCopyWith<$Res> {
  factory _$$DailyContentInstanceImplCopyWith(_$DailyContentInstanceImpl value,
          $Res Function(_$DailyContentInstanceImpl) then) =
      __$$DailyContentInstanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dailyContentInstanceId,
      String dailyContentId,
      Item item,
      @TimestampConverter() DateTime date});

  @override
  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$DailyContentInstanceImplCopyWithImpl<$Res>
    extends _$DailyContentInstanceCopyWithImpl<$Res, _$DailyContentInstanceImpl>
    implements _$$DailyContentInstanceImplCopyWith<$Res> {
  __$$DailyContentInstanceImplCopyWithImpl(_$DailyContentInstanceImpl _value,
      $Res Function(_$DailyContentInstanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyContentInstance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyContentInstanceId = null,
    Object? dailyContentId = null,
    Object? item = null,
    Object? date = null,
  }) {
    return _then(_$DailyContentInstanceImpl(
      dailyContentInstanceId: null == dailyContentInstanceId
          ? _value.dailyContentInstanceId
          : dailyContentInstanceId // ignore: cast_nullable_to_non_nullable
              as String,
      dailyContentId: null == dailyContentId
          ? _value.dailyContentId
          : dailyContentId // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyContentInstanceImpl implements _DailyContentInstance {
  _$DailyContentInstanceImpl(
      {required this.dailyContentInstanceId,
      required this.dailyContentId,
      required this.item,
      @TimestampConverter() required this.date});

  factory _$DailyContentInstanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyContentInstanceImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyContentInstanceImpl &&
            (identical(other.dailyContentInstanceId, dailyContentInstanceId) ||
                other.dailyContentInstanceId == dailyContentInstanceId) &&
            (identical(other.dailyContentId, dailyContentId) ||
                other.dailyContentId == dailyContentId) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, dailyContentInstanceId, dailyContentId, item, date);

  /// Create a copy of DailyContentInstance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyContentInstanceImplCopyWith<_$DailyContentInstanceImpl>
      get copyWith =>
          __$$DailyContentInstanceImplCopyWithImpl<_$DailyContentInstanceImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyContentInstanceImplToJson(
      this,
    );
  }
}

abstract class _DailyContentInstance implements DailyContentInstance {
  factory _DailyContentInstance(
          {required final String dailyContentInstanceId,
          required final String dailyContentId,
          required final Item item,
          @TimestampConverter() required final DateTime date}) =
      _$DailyContentInstanceImpl;

  factory _DailyContentInstance.fromJson(Map<String, dynamic> json) =
      _$DailyContentInstanceImpl.fromJson;

  @override
  String get dailyContentInstanceId;
  @override
  String get dailyContentId;
  @override
  Item get item;
  @override
  @TimestampConverter()
  DateTime get date;

  /// Create a copy of DailyContentInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyContentInstanceImplCopyWith<_$DailyContentInstanceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
