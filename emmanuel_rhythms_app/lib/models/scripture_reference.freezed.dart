// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scripture_reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScriptureReference _$ScriptureReferenceFromJson(Map<String, dynamic> json) {
  return _ScriptureReference.fromJson(json);
}

/// @nodoc
mixin _$ScriptureReference {
  String get id => throw _privateConstructorUsedError;
  BibleBook get book => throw _privateConstructorUsedError;
  int? get fromChapter => throw _privateConstructorUsedError;
  int? get toChapter => throw _privateConstructorUsedError;
  int? get fromVerse => throw _privateConstructorUsedError;
  int? get toVerse => throw _privateConstructorUsedError;

  /// Serializes this ScriptureReference to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScriptureReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScriptureReferenceCopyWith<ScriptureReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScriptureReferenceCopyWith<$Res> {
  factory $ScriptureReferenceCopyWith(
          ScriptureReference value, $Res Function(ScriptureReference) then) =
      _$ScriptureReferenceCopyWithImpl<$Res, ScriptureReference>;
  @useResult
  $Res call(
      {String id,
      BibleBook book,
      int? fromChapter,
      int? toChapter,
      int? fromVerse,
      int? toVerse});
}

/// @nodoc
class _$ScriptureReferenceCopyWithImpl<$Res, $Val extends ScriptureReference>
    implements $ScriptureReferenceCopyWith<$Res> {
  _$ScriptureReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScriptureReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? book = null,
    Object? fromChapter = freezed,
    Object? toChapter = freezed,
    Object? fromVerse = freezed,
    Object? toVerse = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BibleBook,
      fromChapter: freezed == fromChapter
          ? _value.fromChapter
          : fromChapter // ignore: cast_nullable_to_non_nullable
              as int?,
      toChapter: freezed == toChapter
          ? _value.toChapter
          : toChapter // ignore: cast_nullable_to_non_nullable
              as int?,
      fromVerse: freezed == fromVerse
          ? _value.fromVerse
          : fromVerse // ignore: cast_nullable_to_non_nullable
              as int?,
      toVerse: freezed == toVerse
          ? _value.toVerse
          : toVerse // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScriptureReferenceImplCopyWith<$Res>
    implements $ScriptureReferenceCopyWith<$Res> {
  factory _$$ScriptureReferenceImplCopyWith(_$ScriptureReferenceImpl value,
          $Res Function(_$ScriptureReferenceImpl) then) =
      __$$ScriptureReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      BibleBook book,
      int? fromChapter,
      int? toChapter,
      int? fromVerse,
      int? toVerse});
}

/// @nodoc
class __$$ScriptureReferenceImplCopyWithImpl<$Res>
    extends _$ScriptureReferenceCopyWithImpl<$Res, _$ScriptureReferenceImpl>
    implements _$$ScriptureReferenceImplCopyWith<$Res> {
  __$$ScriptureReferenceImplCopyWithImpl(_$ScriptureReferenceImpl _value,
      $Res Function(_$ScriptureReferenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScriptureReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? book = null,
    Object? fromChapter = freezed,
    Object? toChapter = freezed,
    Object? fromVerse = freezed,
    Object? toVerse = freezed,
  }) {
    return _then(_$ScriptureReferenceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as BibleBook,
      fromChapter: freezed == fromChapter
          ? _value.fromChapter
          : fromChapter // ignore: cast_nullable_to_non_nullable
              as int?,
      toChapter: freezed == toChapter
          ? _value.toChapter
          : toChapter // ignore: cast_nullable_to_non_nullable
              as int?,
      fromVerse: freezed == fromVerse
          ? _value.fromVerse
          : fromVerse // ignore: cast_nullable_to_non_nullable
              as int?,
      toVerse: freezed == toVerse
          ? _value.toVerse
          : toVerse // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScriptureReferenceImpl implements _ScriptureReference {
  _$ScriptureReferenceImpl(
      {required this.id,
      required this.book,
      this.fromChapter,
      this.toChapter,
      this.fromVerse,
      this.toVerse});

  factory _$ScriptureReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScriptureReferenceImplFromJson(json);

  @override
  final String id;
  @override
  final BibleBook book;
  @override
  final int? fromChapter;
  @override
  final int? toChapter;
  @override
  final int? fromVerse;
  @override
  final int? toVerse;

  @override
  String toString() {
    return 'ScriptureReference(id: $id, book: $book, fromChapter: $fromChapter, toChapter: $toChapter, fromVerse: $fromVerse, toVerse: $toVerse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScriptureReferenceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.fromChapter, fromChapter) ||
                other.fromChapter == fromChapter) &&
            (identical(other.toChapter, toChapter) ||
                other.toChapter == toChapter) &&
            (identical(other.fromVerse, fromVerse) ||
                other.fromVerse == fromVerse) &&
            (identical(other.toVerse, toVerse) || other.toVerse == toVerse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, book, fromChapter, toChapter, fromVerse, toVerse);

  /// Create a copy of ScriptureReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScriptureReferenceImplCopyWith<_$ScriptureReferenceImpl> get copyWith =>
      __$$ScriptureReferenceImplCopyWithImpl<_$ScriptureReferenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScriptureReferenceImplToJson(
      this,
    );
  }
}

abstract class _ScriptureReference implements ScriptureReference {
  factory _ScriptureReference(
      {required final String id,
      required final BibleBook book,
      final int? fromChapter,
      final int? toChapter,
      final int? fromVerse,
      final int? toVerse}) = _$ScriptureReferenceImpl;

  factory _ScriptureReference.fromJson(Map<String, dynamic> json) =
      _$ScriptureReferenceImpl.fromJson;

  @override
  String get id;
  @override
  BibleBook get book;
  @override
  int? get fromChapter;
  @override
  int? get toChapter;
  @override
  int? get fromVerse;
  @override
  int? get toVerse;

  /// Create a copy of ScriptureReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScriptureReferenceImplCopyWith<_$ScriptureReferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
