// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) initial,
    required TResult Function(bool isSeen) seen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? initial,
    TResult? Function(bool isSeen)? seen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? initial,
    TResult Function(bool isSeen)? seen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Seen value) seen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Seen value)? seen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Seen value)? seen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$InitialImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'OnboardingState.initial(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) initial,
    required TResult Function(bool isSeen) seen,
  }) {
    return initial(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? initial,
    TResult? Function(bool isSeen)? seen,
  }) {
    return initial?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? initial,
    TResult Function(bool isSeen)? seen,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Seen value) seen,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Seen value)? seen,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Seen value)? seen,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OnboardingState {
  const factory _Initial(final int index) = _$InitialImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SeenImplCopyWith<$Res> {
  factory _$$SeenImplCopyWith(
          _$SeenImpl value, $Res Function(_$SeenImpl) then) =
      __$$SeenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isSeen});
}

/// @nodoc
class __$$SeenImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$SeenImpl>
    implements _$$SeenImplCopyWith<$Res> {
  __$$SeenImplCopyWithImpl(_$SeenImpl _value, $Res Function(_$SeenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSeen = null,
  }) {
    return _then(_$SeenImpl(
      null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SeenImpl implements _Seen {
  const _$SeenImpl(this.isSeen);

  @override
  final bool isSeen;

  @override
  String toString() {
    return 'OnboardingState.seen(isSeen: $isSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeenImpl &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSeen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeenImplCopyWith<_$SeenImpl> get copyWith =>
      __$$SeenImplCopyWithImpl<_$SeenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) initial,
    required TResult Function(bool isSeen) seen,
  }) {
    return seen(isSeen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? initial,
    TResult? Function(bool isSeen)? seen,
  }) {
    return seen?.call(isSeen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? initial,
    TResult Function(bool isSeen)? seen,
    required TResult orElse(),
  }) {
    if (seen != null) {
      return seen(isSeen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Seen value) seen,
  }) {
    return seen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Seen value)? seen,
  }) {
    return seen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Seen value)? seen,
    required TResult orElse(),
  }) {
    if (seen != null) {
      return seen(this);
    }
    return orElse();
  }
}

abstract class _Seen implements OnboardingState {
  const factory _Seen(final bool isSeen) = _$SeenImpl;

  bool get isSeen;
  @JsonKey(ignore: true)
  _$$SeenImplCopyWith<_$SeenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
