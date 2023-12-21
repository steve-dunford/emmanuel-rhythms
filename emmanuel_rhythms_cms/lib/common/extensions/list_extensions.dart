extension ListExtensions<E> on List<E> {

  E? firstOrNullWhere(bool Function(E) predicate) {
    if(any(predicate)) {
      return firstWhere(predicate);
    }

    return null;
  }
}