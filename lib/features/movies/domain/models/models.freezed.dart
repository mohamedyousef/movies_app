// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieList {
  List<MovieModel> get movies => throw _privateConstructorUsedError;
  ListMeta get listMeta => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieListCopyWith<MovieList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListCopyWith<$Res> {
  factory $MovieListCopyWith(MovieList value, $Res Function(MovieList) then) =
      _$MovieListCopyWithImpl<$Res, MovieList>;
  @useResult
  $Res call({List<MovieModel> movies, ListMeta listMeta});

  $ListMetaCopyWith<$Res> get listMeta;
}

/// @nodoc
class _$MovieListCopyWithImpl<$Res, $Val extends MovieList>
    implements $MovieListCopyWith<$Res> {
  _$MovieListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? listMeta = null,
  }) {
    return _then(_value.copyWith(
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>,
      listMeta: null == listMeta
          ? _value.listMeta
          : listMeta // ignore: cast_nullable_to_non_nullable
              as ListMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ListMetaCopyWith<$Res> get listMeta {
    return $ListMetaCopyWith<$Res>(_value.listMeta, (value) {
      return _then(_value.copyWith(listMeta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieListImplCopyWith<$Res>
    implements $MovieListCopyWith<$Res> {
  factory _$$MovieListImplCopyWith(
          _$MovieListImpl value, $Res Function(_$MovieListImpl) then) =
      __$$MovieListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MovieModel> movies, ListMeta listMeta});

  @override
  $ListMetaCopyWith<$Res> get listMeta;
}

/// @nodoc
class __$$MovieListImplCopyWithImpl<$Res>
    extends _$MovieListCopyWithImpl<$Res, _$MovieListImpl>
    implements _$$MovieListImplCopyWith<$Res> {
  __$$MovieListImplCopyWithImpl(
      _$MovieListImpl _value, $Res Function(_$MovieListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? listMeta = null,
  }) {
    return _then(_$MovieListImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>,
      listMeta: null == listMeta
          ? _value.listMeta
          : listMeta // ignore: cast_nullable_to_non_nullable
              as ListMeta,
    ));
  }
}

/// @nodoc

class _$MovieListImpl extends _MovieList {
  const _$MovieListImpl(
      {required final List<MovieModel> movies, required this.listMeta})
      : _movies = movies,
        super._();

  final List<MovieModel> _movies;
  @override
  List<MovieModel> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final ListMeta listMeta;

  @override
  String toString() {
    return 'MovieList(movies: $movies, listMeta: $listMeta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.listMeta, listMeta) ||
                other.listMeta == listMeta));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_movies), listMeta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListImplCopyWith<_$MovieListImpl> get copyWith =>
      __$$MovieListImplCopyWithImpl<_$MovieListImpl>(this, _$identity);
}

abstract class _MovieList extends MovieList {
  const factory _MovieList(
      {required final List<MovieModel> movies,
      required final ListMeta listMeta}) = _$MovieListImpl;
  const _MovieList._() : super._();

  @override
  List<MovieModel> get movies;
  @override
  ListMeta get listMeta;
  @override
  @JsonKey(ignore: true)
  _$$MovieListImplCopyWith<_$MovieListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListMeta {
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListMetaCopyWith<ListMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListMetaCopyWith<$Res> {
  factory $ListMetaCopyWith(ListMeta value, $Res Function(ListMeta) then) =
      _$ListMetaCopyWithImpl<$Res, ListMeta>;
  @useResult
  $Res call({int currentPage, int totalPages, int totalResults});
}

/// @nodoc
class _$ListMetaCopyWithImpl<$Res, $Val extends ListMeta>
    implements $ListMetaCopyWith<$Res> {
  _$ListMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListMetaImplCopyWith<$Res>
    implements $ListMetaCopyWith<$Res> {
  factory _$$ListMetaImplCopyWith(
          _$ListMetaImpl value, $Res Function(_$ListMetaImpl) then) =
      __$$ListMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, int totalPages, int totalResults});
}

/// @nodoc
class __$$ListMetaImplCopyWithImpl<$Res>
    extends _$ListMetaCopyWithImpl<$Res, _$ListMetaImpl>
    implements _$$ListMetaImplCopyWith<$Res> {
  __$$ListMetaImplCopyWithImpl(
      _$ListMetaImpl _value, $Res Function(_$ListMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_$ListMetaImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ListMetaImpl extends _ListMeta {
  const _$ListMetaImpl(
      {required this.currentPage,
      required this.totalPages,
      required this.totalResults})
      : super._();

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final int totalResults;

  @override
  String toString() {
    return 'ListMeta(currentPage: $currentPage, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListMetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListMetaImplCopyWith<_$ListMetaImpl> get copyWith =>
      __$$ListMetaImplCopyWithImpl<_$ListMetaImpl>(this, _$identity);
}

abstract class _ListMeta extends ListMeta {
  const factory _ListMeta(
      {required final int currentPage,
      required final int totalPages,
      required final int totalResults}) = _$ListMetaImpl;
  const _ListMeta._() : super._();

  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$ListMetaImplCopyWith<_$ListMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MovieModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get overView => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;
  ImageModel get poster => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieModelCopyWith<MovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieModelCopyWith<$Res> {
  factory $MovieModelCopyWith(
          MovieModel value, $Res Function(MovieModel) then) =
      _$MovieModelCopyWithImpl<$Res, MovieModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String overView,
      String releaseDate,
      ImageModel poster});

  $ImageModelCopyWith<$Res> get poster;
}

/// @nodoc
class _$MovieModelCopyWithImpl<$Res, $Val extends MovieModel>
    implements $MovieModelCopyWith<$Res> {
  _$MovieModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overView = null,
    Object? releaseDate = null,
    Object? poster = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overView: null == overView
          ? _value.overView
          : overView // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as ImageModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageModelCopyWith<$Res> get poster {
    return $ImageModelCopyWith<$Res>(_value.poster, (value) {
      return _then(_value.copyWith(poster: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieModelImplCopyWith<$Res>
    implements $MovieModelCopyWith<$Res> {
  factory _$$MovieModelImplCopyWith(
          _$MovieModelImpl value, $Res Function(_$MovieModelImpl) then) =
      __$$MovieModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String overView,
      String releaseDate,
      ImageModel poster});

  @override
  $ImageModelCopyWith<$Res> get poster;
}

/// @nodoc
class __$$MovieModelImplCopyWithImpl<$Res>
    extends _$MovieModelCopyWithImpl<$Res, _$MovieModelImpl>
    implements _$$MovieModelImplCopyWith<$Res> {
  __$$MovieModelImplCopyWithImpl(
      _$MovieModelImpl _value, $Res Function(_$MovieModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overView = null,
    Object? releaseDate = null,
    Object? poster = null,
  }) {
    return _then(_$MovieModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overView: null == overView
          ? _value.overView
          : overView // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as ImageModel,
    ));
  }
}

/// @nodoc

class _$MovieModelImpl implements _MovieModel {
  const _$MovieModelImpl(
      {required this.id,
      required this.title,
      required this.overView,
      required this.releaseDate,
      required this.poster});

  @override
  final int id;
  @override
  final String title;
  @override
  final String overView;
  @override
  final String releaseDate;
  @override
  final ImageModel poster;

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, overView: $overView, releaseDate: $releaseDate, poster: $poster)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overView, overView) ||
                other.overView == overView) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.poster, poster) || other.poster == poster));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, overView, releaseDate, poster);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieModelImplCopyWith<_$MovieModelImpl> get copyWith =>
      __$$MovieModelImplCopyWithImpl<_$MovieModelImpl>(this, _$identity);
}

abstract class _MovieModel implements MovieModel {
  const factory _MovieModel(
      {required final int id,
      required final String title,
      required final String overView,
      required final String releaseDate,
      required final ImageModel poster}) = _$MovieModelImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get overView;
  @override
  String get releaseDate;
  @override
  ImageModel get poster;
  @override
  @JsonKey(ignore: true)
  _$$MovieModelImplCopyWith<_$MovieModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ImageModel {
  String get path => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageModelCopyWith<ImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageModelCopyWith<$Res> {
  factory $ImageModelCopyWith(
          ImageModel value, $Res Function(ImageModel) then) =
      _$ImageModelCopyWithImpl<$Res, ImageModel>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class _$ImageModelCopyWithImpl<$Res, $Val extends ImageModel>
    implements $ImageModelCopyWith<$Res> {
  _$ImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageModelImplCopyWith<$Res>
    implements $ImageModelCopyWith<$Res> {
  factory _$$ImageModelImplCopyWith(
          _$ImageModelImpl value, $Res Function(_$ImageModelImpl) then) =
      __$$ImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$ImageModelImplCopyWithImpl<$Res>
    extends _$ImageModelCopyWithImpl<$Res, _$ImageModelImpl>
    implements _$$ImageModelImplCopyWith<$Res> {
  __$$ImageModelImplCopyWithImpl(
      _$ImageModelImpl _value, $Res Function(_$ImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$ImageModelImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImageModelImpl extends _ImageModel {
  const _$ImageModelImpl({required this.path}) : super._();

  @override
  final String path;

  @override
  String toString() {
    return 'ImageModel(path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageModelImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageModelImplCopyWith<_$ImageModelImpl> get copyWith =>
      __$$ImageModelImplCopyWithImpl<_$ImageModelImpl>(this, _$identity);
}

abstract class _ImageModel extends ImageModel {
  const factory _ImageModel({required final String path}) = _$ImageModelImpl;
  const _ImageModel._() : super._();

  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$ImageModelImplCopyWith<_$ImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
