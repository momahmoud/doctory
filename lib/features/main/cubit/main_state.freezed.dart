// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T index) changing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T index)? changing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T index)? changing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Changing<T> value) changing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(Changing<T> value)? changing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Changing<T> value)? changing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<T, $Res> {
  factory $MainStateCopyWith(
          MainState<T> value, $Res Function(MainState<T>) then) =
      _$MainStateCopyWithImpl<T, $Res, MainState<T>>;
}

/// @nodoc
class _$MainStateCopyWithImpl<T, $Res, $Val extends MainState<T>>
    implements $MainStateCopyWith<T, $Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$MainStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MainState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T index) changing,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T index)? changing,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T index)? changing,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Changing<T> value) changing,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(Changing<T> value)? changing,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Changing<T> value)? changing,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial<T> implements MainState<T> {
  const factory Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$ChangingImplCopyWith<T, $Res> {
  factory _$$ChangingImplCopyWith(
          _$ChangingImpl<T> value, $Res Function(_$ChangingImpl<T>) then) =
      __$$ChangingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T index});
}

/// @nodoc
class __$$ChangingImplCopyWithImpl<T, $Res>
    extends _$MainStateCopyWithImpl<T, $Res, _$ChangingImpl<T>>
    implements _$$ChangingImplCopyWith<T, $Res> {
  __$$ChangingImplCopyWithImpl(
      _$ChangingImpl<T> _value, $Res Function(_$ChangingImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$ChangingImpl<T>(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ChangingImpl<T> implements Changing<T> {
  const _$ChangingImpl({required this.index});

  @override
  final T index;

  @override
  String toString() {
    return 'MainState<$T>.changing(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangingImpl<T> &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangingImplCopyWith<T, _$ChangingImpl<T>> get copyWith =>
      __$$ChangingImplCopyWithImpl<T, _$ChangingImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T index) changing,
  }) {
    return changing(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T index)? changing,
  }) {
    return changing?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T index)? changing,
    required TResult orElse(),
  }) {
    if (changing != null) {
      return changing(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Changing<T> value) changing,
  }) {
    return changing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(Changing<T> value)? changing,
  }) {
    return changing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Changing<T> value)? changing,
    required TResult orElse(),
  }) {
    if (changing != null) {
      return changing(this);
    }
    return orElse();
  }
}

abstract class Changing<T> implements MainState<T> {
  const factory Changing({required final T index}) = _$ChangingImpl<T>;

  T get index;
  @JsonKey(ignore: true)
  _$$ChangingImplCopyWith<T, _$ChangingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
