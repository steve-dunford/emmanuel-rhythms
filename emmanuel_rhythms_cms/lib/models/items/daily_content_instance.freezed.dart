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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DailyContentInstanceCopyWith<$Res>
    implements $DailyContentInstanceCopyWith<$Res> {
  factory _$$_DailyContentInstanceCopyWith(_$_DailyContentInstance value,
          $Res Function(_$_DailyContentInstance) then) =
      __$$_DailyContentInstanceCopyWithImpl<$Res>;
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
class __$$_DailyContentInstanceCopyWithImpl<$Res>
    extends _$DailyContentInstanceCopyWithImpl<$Res, _$_DailyContentInstance>
    implements _$$_DailyContentInstanceCopyWith<$Res> {
  __$$_DailyContentInstanceCopyWithImpl(_$_DailyContentInstance _value,
      $Res Function(_$_DailyContentInstance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyContentInstanceId = null,
    Object? dailyContentId = null,
    Object? item = null,
    Object? date = null,
  }) {
    return _then(_$_DailyContentInstance(
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
            other is _$_DailyContentInstance &&
            (identical(other.dailyContentInstanceId, dailyContentInstanceId) ||
                other.dailyContentInstanceId == dailyContentInstanceId) &&
            (identical(other.dailyContentId, dailyContentId) ||
                other.dailyContentId == dailyContentId) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dailyContentInstanceId, dailyContentId, item, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyContentInstanceCopyWith<_$_DailyContentInstance> get copyWith =>
      __$$_DailyContentInstanceCopyWithImpl<_$_DailyContentInstance>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyContentInstanceToJson(
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
      _$_DailyContentInstance;

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
  _$$_DailyContentInstanceCopyWith<_$_DailyContentInstance> get copyWith =>
      throw _privateConstructorUsedError;
}
