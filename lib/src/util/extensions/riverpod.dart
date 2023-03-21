import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamonos_mgp/src/util/errors.dart';

extension AsyncValueEither<T extends AppError, U> on AsyncValue<Either<T, U>> {
  R fold<R>({
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    required R Function(U data) data,
    required R Function(T error, StackTrace stackTrace) error,
    required R Function() loading,
  }) {
    if (isLoading) {
      bool skip;
      if (isRefreshing) {
        skip = skipLoadingOnRefresh;
      } else if (isReloading) {
        skip = skipLoadingOnReload;
      } else {
        skip = false;
      }
      if (!skip) return loading();
    }

    if (hasError && (!hasValue || !skipError)) {
      AppError err;
      if (this.error! is AppError) {
        err = this.error! as AppError;
      } else {
        err = LibraryImplementationError(description: this.error!.toString());
      }
      return error(err as T, stackTrace!);
    }

    return requireValue.fold<R>((l) => error(l, l.stackTrace), (r) => data(r));
  }
}
