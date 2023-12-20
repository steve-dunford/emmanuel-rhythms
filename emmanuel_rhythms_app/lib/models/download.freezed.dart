// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'download.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Download _$DownloadFromJson(Map<String, dynamic> json) {
  return _Download.fromJson(json);
}

/// @nodoc
class _$DownloadTearOff {
  const _$DownloadTearOff();

  _Download call(
      {required String id,
      required DownloadType downloadType,
      required String filename,
      required String url}) {
    return _Download(
      id: id,
      downloadType: downloadType,
      filename: filename,
      url: url,
    );
  }

  Download fromJson(Map<String, Object?> json) {
    return Download.fromJson(json);
  }
}

/// @nodoc
const $Download = _$DownloadTearOff();

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
      _$DownloadCopyWithImpl<$Res>;
  $Res call(
      {String id, DownloadType downloadType, String filename, String url});
}

/// @nodoc
class _$DownloadCopyWithImpl<$Res> implements $DownloadCopyWith<$Res> {
  _$DownloadCopyWithImpl(this._value, this._then);

  final Download _value;
  // ignore: unused_field
  final $Res Function(Download) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? downloadType = freezed,
    Object? filename = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      downloadType: downloadType == freezed
          ? _value.downloadType
          : downloadType // ignore: cast_nullable_to_non_nullable
              as DownloadType,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DownloadCopyWith<$Res> implements $DownloadCopyWith<$Res> {
  factory _$DownloadCopyWith(_Download value, $Res Function(_Download) then) =
      __$DownloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, DownloadType downloadType, String filename, String url});
}

/// @nodoc
class __$DownloadCopyWithImpl<$Res> extends _$DownloadCopyWithImpl<$Res>
    implements _$DownloadCopyWith<$Res> {
  __$DownloadCopyWithImpl(_Download _value, $Res Function(_Download) _then)
      : super(_value, (v) => _then(v as _Download));

  @override
  _Download get _value => super._value as _Download;

  @override
  $Res call({
    Object? id = freezed,
    Object? downloadType = freezed,
    Object? filename = freezed,
    Object? url = freezed,
  }) {
    return _then(_Download(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      downloadType: downloadType == freezed
          ? _value.downloadType
          : downloadType // ignore: cast_nullable_to_non_nullable
              as DownloadType,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Download implements _Download {
  _$_Download(
      {required this.id,
      required this.downloadType,
      required this.filename,
      required this.url});

  factory _$_Download.fromJson(Map<String, dynamic> json) =>
      _$$_DownloadFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Download &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.downloadType, downloadType) &&
            const DeepCollectionEquality().equals(other.filename, filename) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(downloadType),
      const DeepCollectionEquality().hash(filename),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$DownloadCopyWith<_Download> get copyWith =>
      __$DownloadCopyWithImpl<_Download>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DownloadToJson(this);
  }
}

abstract class _Download implements Download {
  factory _Download(
      {required String id,
      required DownloadType downloadType,
      required String filename,
      required String url}) = _$_Download;

  factory _Download.fromJson(Map<String, dynamic> json) = _$_Download.fromJson;

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
  _$DownloadCopyWith<_Download> get copyWith =>
      throw _privateConstructorUsedError;
}
