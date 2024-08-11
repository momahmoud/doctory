import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState<T> with _$MainState<T> {
  const factory MainState.initial() = Initial;
  const factory MainState.changing({required T index}) = Changing<T>;
}
