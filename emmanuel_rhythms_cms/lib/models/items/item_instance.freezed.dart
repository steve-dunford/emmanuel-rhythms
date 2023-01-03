// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$ItemInstanceCopyWithImpl<$Res>;
  $Res call(
      {String itemInstanceId, Item item, @TimestampConverter() DateTime date});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$ItemInstanceCopyWithImpl<$Res> implements $ItemInstanceCopyWith<$Res> {
  _$ItemInstanceCopyWithImpl(this._value, this._then);

  final ItemInstance _value;
  // ignore: unused_field
  final $Res Function(ItemInstance) _then;

  @override
  $Res call({
    Object? itemInstanceId = freezed,
    Object? item = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      itemInstanceId: itemInstanceId == freezed
          ? _value.itemInstanceId
          : itemInstanceId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ItemInstanceCopyWith<$Res>
    implements $ItemInstanceCopyWith<$Res> {
  factory _$$_ItemInstanceCopyWith(
          _$_ItemInstance value, $Res Function(_$_ItemInstance) then) =
      __$$_ItemInstanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String itemInstanceId, Item item, @TimestampConverter() DateTime date});

  @override
  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ItemInstanceCopyWithImpl<$Res>
    extends _$ItemInstanceCopyWithImpl<$Res>
    implements _$$_ItemInstanceCopyWith<$Res> {
  __$$_ItemInstanceCopyWithImpl(
      _$_ItemInstance _value, $Res Function(_$_ItemInstance) _then)
      : super(_value, (v) => _then(v as _$_ItemInstance));

  @override
  _$_ItemInstance get _value => super._value as _$_ItemInstance;

  @override
  $Res call({
    Object? itemInstanceId = freezed,
    Object? item = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_ItemInstance(
      itemInstanceId: itemInstanceId == freezed
          ? _value.itemInstanceId
          : itemInstanceId // ignore: cast_nullable_to_non_nullable
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
            const DeepCollectionEquality()
                .equals(other.itemInstanceId, itemInstanceId) &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(itemInstanceId),
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_ItemInstanceCopyWith<_$_ItemInstance> get copyWith =>
      __$$_ItemInstanceCopyWithImpl<_$_ItemInstance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemInstanceToJson(this);
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
