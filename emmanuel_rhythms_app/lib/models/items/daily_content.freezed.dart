// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyContent _$DailyContentFromJson(Map<String, dynamic> json) {
  return _DailyContent.fromJson(json);
}

/// @nodoc
mixin _$DailyContent {
  String get dailyContentId => throw _privateConstructorUsedError;
  ScheduleType get scheduleType => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get startDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get endDate => throw _privateConstructorUsedError;
  List<int>? get daysOfWeek => throw _privateConstructorUsedError;
  Item get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyContentCopyWith<DailyContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyContentCopyWith<$Res> {
  factory $DailyContentCopyWith(
          DailyContent value, $Res Function(DailyContent) then) =
      _$DailyContentCopyWithImpl<$Res, DailyContent>;
  @useResult
  $Res call(
      {String dailyContentId,
      ScheduleType scheduleType,
      @TimestampConverter() DateTime startDate,
      @TimestampConverter() DateTime endDate,
      List<int>? daysOfWeek,
      Item item});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$DailyContentCopyWithImpl<$Res, $Val extends DailyContent>
    implements $DailyContentCopyWith<$Res> {
  _$DailyContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyContentId = null,
    Object? scheduleType = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? daysOfWeek = freezed,
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      dailyContentId: null == dailyContentId
          ? _value.dailyContentId
          : dailyContentId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as ScheduleType,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      daysOfWeek: freezed == daysOfWeek
          ? _value.daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
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
abstract class _$$_DailyContentCopyWith<$Res>
    implements $DailyContentCopyWith<$Res> {
  factory _$$_DailyContentCopyWith(
          _$_DailyContent value, $Res Function(_$_DailyContent) then) =
      __$$_DailyContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dailyContentId,
      ScheduleType scheduleType,
      @TimestampConverter() DateTime startDate,
      @TimestampConverter() DateTime endDate,
      List<int>? daysOfWeek,
      Item item});

  @override
  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_DailyContentCopyWithImpl<$Res>
    extends _$DailyContentCopyWithImpl<$Res, _$_DailyContent>
    implements _$$_DailyContentCopyWith<$Res> {
  __$$_DailyContentCopyWithImpl(
      _$_DailyContent _value, $Res Function(_$_DailyContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyContentId = null,
    Object? scheduleType = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? daysOfWeek = freezed,
    Object? item = null,
  }) {
    return _then(_$_DailyContent(
      dailyContentId: null == dailyContentId
          ? _value.dailyContentId
          : dailyContentId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as ScheduleType,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      daysOfWeek: freezed == daysOfWeek
          ? _value._daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DailyContent implements _DailyContent {
  _$_DailyContent(
      {required this.dailyContentId,
      required this.scheduleType,
      @TimestampConverter() required this.startDate,
      @TimestampConverter() required this.endDate,
      final List<int>? daysOfWeek,
      required this.item})
      : _daysOfWeek = daysOfWeek;

  factory _$_DailyContent.fromJson(Map<String, dynamic> json) =>
      _$$_DailyContentFromJson(json);

  @override
  final String dailyContentId;
  @override
  final ScheduleType scheduleType;
  @override
  @TimestampConverter()
  final DateTime startDate;
  @override
  @TimestampConverter()
  final DateTime endDate;
  final List<int>? _daysOfWeek;
  @override
  List<int>? get daysOfWeek {
    final value = _daysOfWeek;
    if (value == null) return null;
    if (_daysOfWeek is EqualUnmodifiableListView) return _daysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Item item;

  @override
  String toString() {
    return 'DailyContent(dailyContentId: $dailyContentId, scheduleType: $scheduleType, startDate: $startDate, endDate: $endDate, daysOfWeek: $daysOfWeek, item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyContent &&
            (identical(other.dailyContentId, dailyContentId) ||
                other.dailyContentId == dailyContentId) &&
            (identical(other.scheduleType, scheduleType) ||
                other.scheduleType == scheduleType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._daysOfWeek, _daysOfWeek) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dailyContentId,
      scheduleType,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_daysOfWeek),
      item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyContentCopyWith<_$_DailyContent> get copyWith =>
      __$$_DailyContentCopyWithImpl<_$_DailyContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyContentToJson(
      this,
    );
  }
}

abstract class _DailyContent implements DailyContent {
  factory _DailyContent(
      {required final String dailyContentId,
      required final ScheduleType scheduleType,
      @TimestampConverter() required final DateTime startDate,
      @TimestampConverter() required final DateTime endDate,
      final List<int>? daysOfWeek,
      required final Item item}) = _$_DailyContent;

  factory _DailyContent.fromJson(Map<String, dynamic> json) =
      _$_DailyContent.fromJson;

  @override
  String get dailyContentId;
  @override
  ScheduleType get scheduleType;
  @override
  @TimestampConverter()
  DateTime get startDate;
  @override
  @TimestampConverter()
  DateTime get endDate;
  @override
  List<int>? get daysOfWeek;
  @override
  Item get item;
  @override
  @JsonKey(ignore: true)
  _$$_DailyContentCopyWith<_$_DailyContent> get copyWith =>
      throw _privateConstructorUsedError;
}
