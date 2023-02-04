// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
class _$ItemTearOff {
  const _$ItemTearOff();

  _Item call(
      {required String id,
      required ItemType type,
      required String title,
      String? description,
      String? backgroundImage,
      String? url,
      String? downloadFilename,
      bool? usePodcastDetails,
      List<ScriptureReference>? scriptureReferences,
      required List<Church> churches,
      required List<Tag> tags}) {
    return _Item(
      id: id,
      type: type,
      title: title,
      description: description,
      backgroundImage: backgroundImage,
      url: url,
      downloadFilename: downloadFilename,
      usePodcastDetails: usePodcastDetails,
      scriptureReferences: scriptureReferences,
      churches: churches,
      tags: tags,
    );
  }

  Item fromJson(Map<String, Object?> json) {
    return Item.fromJson(json);
  }
}

/// @nodoc
const $Item = _$ItemTearOff();

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  ItemType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get backgroundImage => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get downloadFilename => throw _privateConstructorUsedError;
  bool? get usePodcastDetails => throw _privateConstructorUsedError;
  List<ScriptureReference>? get scriptureReferences =>
      throw _privateConstructorUsedError;
  List<Church> get churches => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      ItemType type,
      String title,
      String? description,
      String? backgroundImage,
      String? url,
      String? downloadFilename,
      bool? usePodcastDetails,
      List<ScriptureReference>? scriptureReferences,
      List<Church> churches,
      List<Tag> tags});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? backgroundImage = freezed,
    Object? url = freezed,
    Object? downloadFilename = freezed,
    Object? usePodcastDetails = freezed,
    Object? scriptureReferences = freezed,
    Object? churches = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadFilename: downloadFilename == freezed
          ? _value.downloadFilename
          : downloadFilename // ignore: cast_nullable_to_non_nullable
              as String?,
      usePodcastDetails: usePodcastDetails == freezed
          ? _value.usePodcastDetails
          : usePodcastDetails // ignore: cast_nullable_to_non_nullable
              as bool?,
      scriptureReferences: scriptureReferences == freezed
          ? _value.scriptureReferences
          : scriptureReferences // ignore: cast_nullable_to_non_nullable
              as List<ScriptureReference>?,
      churches: churches == freezed
          ? _value.churches
          : churches // ignore: cast_nullable_to_non_nullable
              as List<Church>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      ItemType type,
      String title,
      String? description,
      String? backgroundImage,
      String? url,
      String? downloadFilename,
      bool? usePodcastDetails,
      List<ScriptureReference>? scriptureReferences,
      List<Church> churches,
      List<Tag> tags});
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? backgroundImage = freezed,
    Object? url = freezed,
    Object? downloadFilename = freezed,
    Object? usePodcastDetails = freezed,
    Object? scriptureReferences = freezed,
    Object? churches = freezed,
    Object? tags = freezed,
  }) {
    return _then(_Item(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadFilename: downloadFilename == freezed
          ? _value.downloadFilename
          : downloadFilename // ignore: cast_nullable_to_non_nullable
              as String?,
      usePodcastDetails: usePodcastDetails == freezed
          ? _value.usePodcastDetails
          : usePodcastDetails // ignore: cast_nullable_to_non_nullable
              as bool?,
      scriptureReferences: scriptureReferences == freezed
          ? _value.scriptureReferences
          : scriptureReferences // ignore: cast_nullable_to_non_nullable
              as List<ScriptureReference>?,
      churches: churches == freezed
          ? _value.churches
          : churches // ignore: cast_nullable_to_non_nullable
              as List<Church>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  _$_Item(
      {required this.id,
      required this.type,
      required this.title,
      this.description,
      this.backgroundImage,
      this.url,
      this.downloadFilename,
      this.usePodcastDetails,
      this.scriptureReferences,
      required this.churches,
      required this.tags});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String id;
  @override
  final ItemType type;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? backgroundImage;
  @override
  final String? url;
  @override
  final String? downloadFilename;
  @override
  final bool? usePodcastDetails;
  @override
  final List<ScriptureReference>? scriptureReferences;
  @override
  final List<Church> churches;
  @override
  final List<Tag> tags;

  @override
  String toString() {
    return 'Item(id: $id, type: $type, title: $title, description: $description, backgroundImage: $backgroundImage, url: $url, downloadFilename: $downloadFilename, usePodcastDetails: $usePodcastDetails, scriptureReferences: $scriptureReferences, churches: $churches, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Item &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.backgroundImage, backgroundImage) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other.downloadFilename, downloadFilename) &&
            const DeepCollectionEquality()
                .equals(other.usePodcastDetails, usePodcastDetails) &&
            const DeepCollectionEquality()
                .equals(other.scriptureReferences, scriptureReferences) &&
            const DeepCollectionEquality().equals(other.churches, churches) &&
            const DeepCollectionEquality().equals(other.tags, tags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(backgroundImage),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(downloadFilename),
      const DeepCollectionEquality().hash(usePodcastDetails),
      const DeepCollectionEquality().hash(scriptureReferences),
      const DeepCollectionEquality().hash(churches),
      const DeepCollectionEquality().hash(tags));

  @JsonKey(ignore: true)
  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(this);
  }
}

abstract class _Item implements Item {
  factory _Item(
      {required String id,
      required ItemType type,
      required String title,
      String? description,
      String? backgroundImage,
      String? url,
      String? downloadFilename,
      bool? usePodcastDetails,
      List<ScriptureReference>? scriptureReferences,
      required List<Church> churches,
      required List<Tag> tags}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get id;
  @override
  ItemType get type;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get backgroundImage;
  @override
  String? get url;
  @override
  String? get downloadFilename;
  @override
  bool? get usePodcastDetails;
  @override
  List<ScriptureReference>? get scriptureReferences;
  @override
  List<Church> get churches;
  @override
  List<Tag> get tags;
  @override
  @JsonKey(ignore: true)
  _$ItemCopyWith<_Item> get copyWith => throw _privateConstructorUsedError;
}
