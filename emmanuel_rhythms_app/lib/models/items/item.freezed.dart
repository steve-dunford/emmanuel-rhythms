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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  @ItemTypeConverter()
  ItemType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isPriority => throw _privateConstructorUsedError;
  int? get sortOrder => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get backgroundImage => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get downloadFilename =>
      throw _privateConstructorUsedError; //Deprecated, use downloads property
  bool? get usePodcastDetails => throw _privateConstructorUsedError;
  List<ScriptureReference>? get scriptureReferences =>
      throw _privateConstructorUsedError;
  List<Download>? get downloads => throw _privateConstructorUsedError;
  List<String>? get churchesV2 => throw _privateConstructorUsedError;
  List<String> get churches => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String id,
      @ItemTypeConverter() ItemType type,
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
      List<String>? churchesV2,
      List<String> churches,
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

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
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
    Object? churchesV2 = freezed,
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
      churchesV2: freezed == churchesV2
          ? _value.churchesV2
          : churchesV2 // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      churches: null == churches
          ? _value.churches
          : churches // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @ItemTypeConverter() ItemType type,
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
      List<String>? churchesV2,
      List<String> churches,
      List<Tag> tags});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
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
    Object? churchesV2 = freezed,
    Object? churches = null,
    Object? tags = null,
  }) {
    return _then(_$ItemImpl(
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
      churchesV2: freezed == churchesV2
          ? _value._churchesV2
          : churchesV2 // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      churches: null == churches
          ? _value._churches
          : churches // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  _$ItemImpl(
      {required this.id,
      @ItemTypeConverter() required this.type,
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
      final List<String>? churchesV2,
      required final List<String> churches,
      required final List<Tag> tags})
      : _scriptureReferences = scriptureReferences,
        _downloads = downloads,
        _churchesV2 = churchesV2,
        _churches = churches,
        _tags = tags;

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String id;
  @override
  @ItemTypeConverter()
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
//Deprecated, use downloads property
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

  final List<String>? _churchesV2;
  @override
  List<String>? get churchesV2 {
    final value = _churchesV2;
    if (value == null) return null;
    if (_churchesV2 is EqualUnmodifiableListView) return _churchesV2;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String> _churches;
  @override
  List<String> get churches {
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
    return 'Item(id: $id, type: $type, title: $title, isPriority: $isPriority, sortOrder: $sortOrder, description: $description, backgroundImage: $backgroundImage, url: $url, downloadFilename: $downloadFilename, usePodcastDetails: $usePodcastDetails, scriptureReferences: $scriptureReferences, downloads: $downloads, churchesV2: $churchesV2, churches: $churches, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
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
            const DeepCollectionEquality()
                .equals(other._churchesV2, _churchesV2) &&
            const DeepCollectionEquality().equals(other._churches, _churches) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      const DeepCollectionEquality().hash(_churchesV2),
      const DeepCollectionEquality().hash(_churches),
      const DeepCollectionEquality().hash(_tags));

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  factory _Item(
      {required final String id,
      @ItemTypeConverter() required final ItemType type,
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
      final List<String>? churchesV2,
      required final List<String> churches,
      required final List<Tag> tags}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get id;
  @override
  @ItemTypeConverter()
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
  String? get downloadFilename; //Deprecated, use downloads property
  @override
  bool? get usePodcastDetails;
  @override
  List<ScriptureReference>? get scriptureReferences;
  @override
  List<Download>? get downloads;
  @override
  List<String>? get churchesV2;
  @override
  List<String> get churches;
  @override
  List<Tag> get tags;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
