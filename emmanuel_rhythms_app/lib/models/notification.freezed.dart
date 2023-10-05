// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ELRNotification _$ELRNotificationFromJson(Map<String, dynamic> json) {
  return _ELRNotification.fromJson(json);
}

/// @nodoc
class _$ELRNotificationTearOff {
  const _$ELRNotificationTearOff();

  _ELRNotification call(
      {required String id,
      required String text,
      required DateTime timestamp,
      String? title,
      String? parentId}) {
    return _ELRNotification(
      id: id,
      text: text,
      timestamp: timestamp,
      title: title,
      parentId: parentId,
    );
  }

  ELRNotification fromJson(Map<String, Object?> json) {
    return ELRNotification.fromJson(json);
  }
}

/// @nodoc
const $ELRNotification = _$ELRNotificationTearOff();

/// @nodoc
mixin _$ELRNotification {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ELRNotificationCopyWith<ELRNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ELRNotificationCopyWith<$Res> {
  factory $ELRNotificationCopyWith(
          ELRNotification value, $Res Function(ELRNotification) then) =
      _$ELRNotificationCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String text,
      DateTime timestamp,
      String? title,
      String? parentId});
}

/// @nodoc
class _$ELRNotificationCopyWithImpl<$Res>
    implements $ELRNotificationCopyWith<$Res> {
  _$ELRNotificationCopyWithImpl(this._value, this._then);

  final ELRNotification _value;
  // ignore: unused_field
  final $Res Function(ELRNotification) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? timestamp = freezed,
    Object? title = freezed,
    Object? parentId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ELRNotificationCopyWith<$Res>
    implements $ELRNotificationCopyWith<$Res> {
  factory _$ELRNotificationCopyWith(
          _ELRNotification value, $Res Function(_ELRNotification) then) =
      __$ELRNotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String text,
      DateTime timestamp,
      String? title,
      String? parentId});
}

/// @nodoc
class __$ELRNotificationCopyWithImpl<$Res>
    extends _$ELRNotificationCopyWithImpl<$Res>
    implements _$ELRNotificationCopyWith<$Res> {
  __$ELRNotificationCopyWithImpl(
      _ELRNotification _value, $Res Function(_ELRNotification) _then)
      : super(_value, (v) => _then(v as _ELRNotification));

  @override
  _ELRNotification get _value => super._value as _ELRNotification;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? timestamp = freezed,
    Object? title = freezed,
    Object? parentId = freezed,
  }) {
    return _then(_ELRNotification(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ELRNotification implements _ELRNotification {
  _$_ELRNotification(
      {required this.id,
      required this.text,
      required this.timestamp,
      this.title,
      this.parentId});

  factory _$_ELRNotification.fromJson(Map<String, dynamic> json) =>
      _$$_ELRNotificationFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final DateTime timestamp;
  @override
  final String? title;
  @override
  final String? parentId;

  @override
  String toString() {
    return 'ELRNotification(id: $id, text: $text, timestamp: $timestamp, title: $title, parentId: $parentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ELRNotification &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.parentId, parentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(parentId));

  @JsonKey(ignore: true)
  @override
  _$ELRNotificationCopyWith<_ELRNotification> get copyWith =>
      __$ELRNotificationCopyWithImpl<_ELRNotification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ELRNotificationToJson(this);
  }
}

abstract class _ELRNotification implements ELRNotification {
  factory _ELRNotification(
      {required String id,
      required String text,
      required DateTime timestamp,
      String? title,
      String? parentId}) = _$_ELRNotification;

  factory _ELRNotification.fromJson(Map<String, dynamic> json) =
      _$_ELRNotification.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  DateTime get timestamp;
  @override
  String? get title;
  @override
  String? get parentId;
  @override
  @JsonKey(ignore: true)
  _$ELRNotificationCopyWith<_ELRNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
