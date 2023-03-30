import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_persisted_state_model.g.dart';
part 'app_persisted_state_model.freezed.dart';

@freezed
class AppPersistedState with _$AppPersistedState {
  const factory AppPersistedState({required bool demoDisplayed}) =
      _AppPersistedState;

  factory AppPersistedState.fromJson(Map<String, Object?> json) =>
      _$AppPersistedStateFromJson(json);
}
