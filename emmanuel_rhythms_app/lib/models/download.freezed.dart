// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Download _$DownloadFromJson(Map<String, dynamic> json) {
  return _Download.fromJson(json);
}

/// @nodoc
mixin _$Download {
  String get id => throw _privateConstructorUsedError;
  DownloadType get downloadType => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DownloadCopyWith<Download> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadCopyWith<$Res> {
  factory $DownloadCopyWith(Download value, $Res Function(Download) then) =
      _$DownloadCopyWithImpl<$Res, Download>;
  @useResult
  $Res call(
      {String id, DownloadType downloadType, String filename, String url});
}

/// @nodoc
class _$DownloadCopyWithImpl<$Res, $Val extends Download>
    implements $DownloadCopyWith<$Res> {
  _$DownloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? downloadType = null,
    Object? filename = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      downloadType: null == downloadType
          ? _value.downloadType
          : downloadType // ignore: cast_nullable_to_non_nullable
              as DownloadType,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadImplCopyWith<$Res>
    implements $DownloadCopyWith<$Res> {
  factory _$$DownloadImplCopyWith(
          _$DownloadImpl value, $Res Function(_$DownloadImpl) then) =
      __$$DownloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, DownloadType downloadType, String filename, String url});
}

/// @nodoc
class __$$DownloadImplCopyWithImpl<$Res>
    extends _$DownloadCopyWithImpl<$Res, _$DownloadImpl>
    implements _$$DownloadImplCopyWith<$Res> {
  __$$DownloadImplCopyWithImpl(
      _$DownloadImpl _value, $Res Function(_$DownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? downloadType = null,
    Object? filename = null,
    Object? url = null,
  }) {
    return _then(_$DownloadImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      downloadType: null == downloadType
          ? _value.downloadType
          : downloadType // ignore: cast_nullable_to_non_nullable
              as DownloadType,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadImpl implements _Download {
  _$DownloadImpl(
      {required this.id,
      required this.downloadType,
      required this.filename,
      required this.url});

  factory _$DownloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloadImplFromJson(json);

  @override
  final String id;
  @override
  final DownloadType downloadType;
  @override
  final String filename;
  @override
  final String url;

  @override
  String toString() {
    return 'Download(id: $id, downloadType: $downloadType, filename: $filename, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.downloadType, downloadType) ||
                other.downloadType == downloadType) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, downloadType, filename, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadImplCopyWith<_$DownloadImpl> get copyWith =>
      __$$DownloadImplCopyWithImpl<_$DownloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadImplToJson(
      this,
    );
  }
}

abstract class _Download implements Download {
  factory _Download(
      {required final String id,
      required final DownloadType downloadType,
      required final String filename,
      required final String url}) = _$DownloadImpl;

  factory _Download.fromJson(Map<String, dynamic> json) =
      _$DownloadImpl.fromJson;

  @override
  String get id;
  @override
  DownloadType get downloadType;
  @override
  String get filename;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$DownloadImplCopyWith<_$DownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
