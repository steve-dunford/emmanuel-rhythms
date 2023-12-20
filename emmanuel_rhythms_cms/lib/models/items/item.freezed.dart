// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  ItemType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isPriority => throw _privateConstructorUsedError;
  int? get sortOrder => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get backgroundImage => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get downloadFilename =>
      throw _privateConstructorUsedError; //Deprecated - use downloads collection instead
  bool? get usePodcastDetails => throw _privateConstructorUsedError;
  List<ScriptureReference>? get scriptureReferences =>
      throw _privateConstructorUsedError;
  List<Download>? get downloads => throw _privateConstructorUsedError;
  List<Church> get churches => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String id,
      ItemType type,
      String title,
      bool isPriority,
      int? sortOrder,
      String? description,
      String? backgroundImage,
      String? url,
      String? downloadFilename,
      bool? usePodcastDetails,
      List<ScriptureReference>? scriptureReferences,
      List<Download>? downloads,
      List<Church> churches,
      List<Tag> tags});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? isPriority = null,
    Object? sortOrder = freezed,
    Object? description = freezed,
    Object? backgroundImage = freezed,
    Object? url = freezed,
    Object? downloadFilename = freezed,
    Object? usePodcastDetails = freezed,
    Object? scriptureReferences = freezed,
    Object? downloads = freezed,
    Object? churches = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isPriority: null == isPriority
          ? _value.isPriority
          : isPriority // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: freezed == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadFilename: freezed == downloadFilename
          ? _value.downloadFilename
          : downloadFilename // ignore: cast_nullable_to_non_nullable
              as String?,
      usePodcastDetails: freezed == usePodcastDetails
          ? _value.usePodcastDetails
          : usePodcastDetails // ignore: cast_nullable_to_non_nullable
              as bool?,
      scriptureReferences: freezed == scriptureReferences
          ? _value.scriptureReferences
          : scriptureReferences // ignore: cast_nullable_to_non_nullable
              as List<ScriptureReference>?,
      downloads: freezed == downloads
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Download>?,
      churches: null == churches
          ? _value.churches
          : churches // ignore: cast_nullable_to_non_nullable
              as List<Church>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ItemType type,
      String title,
      bool isPriority,
      int? sortOrder,
      String? description,
      String? backgroundImage,
      String? url,
      String? downloadFilename,
      bool? usePodcastDetails,
      List<ScriptureReference>? scriptureReferences,
      List<Download>? downloads,
      List<Church> churches,
      List<Tag> tags});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? isPriority = null,
    Object? sortOrder = freezed,
    Object? description = freezed,
    Object? backgroundImage = freezed,
    Object? url = freezed,
    Object? downloadFilename = freezed,
    Object? usePodcastDetails = freezed,
    Object? scriptureReferences = freezed,
    Object? downloads = freezed,
    Object? churches = null,
    Object? tags = null,
  }) {
    return _then(_$_Item(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isPriority: null == isPriority
          ? _value.isPriority
          : isPriority // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: freezed == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadFilename: freezed == downloadFilename
          ? _value.downloadFilename
          : downloadFilename // ignore: cast_nullable_to_non_nullable
              as String?,
      usePodcastDetails: freezed == usePodcastDetails
          ? _value.usePodcastDetails
          : usePodcastDetails // ignore: cast_nullable_to_non_nullable
              as bool?,
      scriptureReferences: freezed == scriptureReferences
          ? _value._scriptureReferences
          : scriptureReferences // ignore: cast_nullable_to_non_nullable
              as List<ScriptureReference>?,
      downloads: freezed == downloads
          ? _value._downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Download>?,
      churches: null == churches
          ? _value._churches
          : churches // ignore: cast_nullable_to_non_nullable
              as List<Church>,
      tags: null == tags
          ? _value._tags
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
      required this.isPriority,
      this.sortOrder,
      this.description,
      this.backgroundImage,
      this.url,
      this.downloadFilename,
      this.usePodcastDetails,
      final List<ScriptureReference>? scriptureReferences,
      final List<Download>? downloads,
      required final List<Church> churches,
      required final List<Tag> tags})
      : _scriptureReferences = scriptureReferences,
        _downloads = downloads,
        _churches = churches,
        _tags = tags;

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String id;
  @override
  final ItemType type;
  @override
  final String title;
  @override
  final bool isPriority;
  @override
  final int? sortOrder;
  @override
  final String? description;
  @override
  final String? backgroundImage;
  @override
  final String? url;
  @override
  final String? downloadFilename;
//Deprecated - use downloads collection instead
  @override
  final bool? usePodcastDetails;
  final List<ScriptureReference>? _scriptureReferences;
  @override
  List<ScriptureReference>? get scriptureReferences {
    final value = _scriptureReferences;
    if (value == null) return null;
    if (_scriptureReferences is EqualUnmodifiableListView)
      return _scriptureReferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Download>? _downloads;
  @override
  List<Download>? get downloads {
    final value = _downloads;
    if (value == null) return null;
    if (_downloads is EqualUnmodifiableListView) return _downloads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Church> _churches;
  @override
  List<Church> get churches {
    if (_churches is EqualUnmodifiableListView) return _churches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_churches);
  }

  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'Item(id: $id, type: $type, title: $title, isPriority: $isPriority, sortOrder: $sortOrder, description: $description, backgroundImage: $backgroundImage, url: $url, downloadFilename: $downloadFilename, usePodcastDetails: $usePodcastDetails, scriptureReferences: $scriptureReferences, downloads: $downloads, churches: $churches, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isPriority, isPriority) ||
                other.isPriority == isPriority) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.downloadFilename, downloadFilename) ||
                other.downloadFilename == downloadFilename) &&
            (identical(other.usePodcastDetails, usePodcastDetails) ||
                other.usePodcastDetails == usePodcastDetails) &&
            const DeepCollectionEquality()
                .equals(other._scriptureReferences, _scriptureReferences) &&
            const DeepCollectionEquality()
                .equals(other._downloads, _downloads) &&
            const DeepCollectionEquality().equals(other._churches, _churches) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      title,
      isPriority,
      sortOrder,
      description,
      backgroundImage,
      url,
      downloadFilename,
      usePodcastDetails,
      const DeepCollectionEquality().hash(_scriptureReferences),
      const DeepCollectionEquality().hash(_downloads),
      const DeepCollectionEquality().hash(_churches),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  factory _Item(
      {required final String id,
      required final ItemType type,
      required final String title,
      required final bool isPriority,
      final int? sortOrder,
      final String? description,
      final String? backgroundImage,
      final String? url,
      final String? downloadFilename,
      final bool? usePodcastDetails,
      final List<ScriptureReference>? scriptureReferences,
      final List<Download>? downloads,
      required final List<Church> churches,
      required final List<Tag> tags}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get id;
  @override
  ItemType get type;
  @override
  String get title;
  @override
  bool get isPriority;
  @override
  int? get sortOrder;
  @override
  String? get description;
  @override
  String? get backgroundImage;
  @override
  String? get url;
  @override
  String? get downloadFilename;
  @override //Deprecated - use downloads collection instead
  bool? get usePodcastDetails;
  @override
  List<ScriptureReference>? get scriptureReferences;
  @override
  List<Download>? get downloads;
  @override
  List<Church> get churches;
  @override
  List<Tag> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
