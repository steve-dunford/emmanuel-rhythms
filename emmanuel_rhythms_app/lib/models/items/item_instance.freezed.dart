// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_instance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemInstance _$ItemInstanceFromJson(Map<String, dynamic> json) {
  return _ItemInstance.fromJson(json);
}

/// @nodoc
mixin _$ItemInstance {
  String get itemInstanceId => throw _privateConstructorUsedError;
  Item get item => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemInstanceCopyWith<ItemInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemInstanceCopyWith<$Res> {
  factory $ItemInstanceCopyWith(
          ItemInstance value, $Res Function(ItemInstance) then) =
      _$ItemInstanceCopyWithImpl<$Res, ItemInstance>;
  @useResult
  $Res call(
      {String itemInstanceId, Item item, @TimestampConverter() DateTime date});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$ItemInstanceCopyWithImpl<$Res, $Val extends ItemInstance>
    implements $ItemInstanceCopyWith<$Res> {
  _$ItemInstanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemInstanceId = null,
    Object? item = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      itemInstanceId: null == itemInstanceId
          ? _value.itemInstanceId
          : itemInstanceId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ItemInstanceCopyWith<$Res>
    implements $ItemInstanceCopyWith<$Res> {
  factory _$$_ItemInstanceCopyWith(
          _$_ItemInstance value, $Res Function(_$_ItemInstance) then) =
      __$$_ItemInstanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemInstanceId, Item item, @TimestampConverter() DateTime date});

  @override
  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ItemInstanceCopyWithImpl<$Res>
    extends _$ItemInstanceCopyWithImpl<$Res, _$_ItemInstance>
    implements _$$_ItemInstanceCopyWith<$Res> {
  __$$_ItemInstanceCopyWithImpl(
      _$_ItemInstance _value, $Res Function(_$_ItemInstance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemInstanceId = null,
    Object? item = null,
    Object? date = null,
  }) {
    return _then(_$_ItemInstance(
      itemInstanceId: null == itemInstanceId
          ? _value.itemInstanceId
          : itemInstanceId // ignore: cast_nullable_to_non_nullable
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
class _$_ItemInstance implements _ItemInstance {
  _$_ItemInstance(
      {required this.itemInstanceId,
      required this.item,
      @TimestampConverter() required this.date});

  factory _$_ItemInstance.fromJson(Map<String, dynamic> json) =>
      _$$_ItemInstanceFromJson(json);

  @override
  final String itemInstanceId;
  @override
  final Item item;
  @override
  @TimestampConverter()
  final DateTime date;

  @override
  String toString() {
    return 'ItemInstance(itemInstanceId: $itemInstanceId, item: $item, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemInstance &&
            (identical(other.itemInstanceId, itemInstanceId) ||
                other.itemInstanceId == itemInstanceId) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, itemInstanceId, item, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemInstanceCopyWith<_$_ItemInstance> get copyWith =>
      __$$_ItemInstanceCopyWithImpl<_$_ItemInstance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemInstanceToJson(
      this,
    );
  }
}

abstract class _ItemInstance implements ItemInstance {
  factory _ItemInstance(
      {required final String itemInstanceId,
      required final Item item,
      @TimestampConverter() required final DateTime date}) = _$_ItemInstance;

  factory _ItemInstance.fromJson(Map<String, dynamic> json) =
      _$_ItemInstance.fromJson;

  @override
  String get itemInstanceId;
  @override
  Item get item;
  @override
  @TimestampConverter()
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_ItemInstanceCopyWith<_$_ItemInstance> get copyWith =>
      throw _privateConstructorUsedError;
}
