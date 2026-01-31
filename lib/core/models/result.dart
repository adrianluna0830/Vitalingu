sealed class Result<E, T> {
  const Result();
}

extension ResultGetters<E, T> on Result<E, T> {
  bool get isOk => this is Ok<E, T>;
  bool get isErr => this is Err<E, T>;
}


final class Ok<E, T> extends Result<E, T> {
  final T value;
  const Ok(this.value);
}

final class Err<E, T> extends Result<E, T> {
  final E error;
  const Err(this.error);
}
