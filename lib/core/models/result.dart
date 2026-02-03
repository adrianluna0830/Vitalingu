sealed class Either<E, T> {
  const Either();
}

extension EitherGetters<E, T> on Either<E, T> {
  bool get isRight => this is Right<E, T>;
  bool get isLeft => this is Left<E, T>;

  K getRightOrThrow<K>() {
    if (this is Right<E, T>) {
      return (this as Right<E, T>).value as K;
    } else {
      throw Exception('Tried to get Right value from Left');
    }
  }

  K getLeftOrThrow<K>() {
    if (this is Left<E, T>) {
      return (this as Left<E, T>).error as K;
    } else {
      throw Exception('Tried to get Left value from Right');
    }
  }


}


final class Right<E, T> extends Either<E, T> {
  final T value;
  const Right(this.value);
}

final class Left<E, T> extends Either<E, T> {
  final E error;
  const Left(this.error);
}
