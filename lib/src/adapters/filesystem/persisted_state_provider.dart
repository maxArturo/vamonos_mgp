import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamonos_mgp/src/entities/app_persisted_state_model.dart';
import 'package:vamonos_mgp/src/util/errors.dart';
import 'package:vamonos_mgp/src/util/fn.dart';

part 'persisted_state_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Directory> Function() path(PathRef ref) {
  return getApplicationDocumentsDirectory;
}

@riverpod
class PersistedState extends _$PersistedState {
  @override
  FutureOr<Either<AppError, AppPersistedState>> build() async {
    return catching(() async {
      return getCurrState();
    })
        .leftMap(
            (l) => castOrFallback(l, ParsingError(description: l.toString())))
        .traverseFuture((r) async => (await r));
  }

  Future<File> _getFile() async {
    final pathFunc = ref.watch(pathProvider);
    return File('${(await pathFunc()).path}/app_data.json');
  }

  Future<AppPersistedState> getCurrState() async {
    final file = await _getFile();

    // initialize if not found
    if (!(await file.exists())) {
      const newState = AppPersistedState(demoDisplayed: false);
      await file.writeAsString(jsonEncode(newState.toJson()));
      return newState;
    }

    try {
      final contents = await file.readAsString();
      final Map<String, dynamic> rawJson = json.decode(contents);
      return AppPersistedState.fromJson(rawJson);
    } on FileSystemException catch (err) {
      throw FileSystemError(description: err.toString());
    } catch (err) {
      // other parsing/unrelated error, set to default state
      const defaultState = AppPersistedState(demoDisplayed: false);
      await file.writeAsString(jsonEncode(defaultState.toJson()));
      return defaultState;
    }
  }

  clearFile() async {
    final file = await _getFile();
    if (await file.exists()) {
      await file.delete();
    }
  }

  setDemoShown() async {
    final file = await _getFile();
    final currState = await getCurrState();
    final newState = currState.copyWith(demoDisplayed: true);
    await file.writeAsString(jsonEncode(newState.toJson()));
    state = AsyncValue.data(Right(newState));
  }
}
