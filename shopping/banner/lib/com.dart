R? ifNotNull<T, R>(T? property, R Function(T value) callback) {
  return property != null ? callback(property) : null;
}