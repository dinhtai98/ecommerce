import 'package:collection/collection.dart' as collection;

extension ListExtension<T> on Iterable<T>? {
  Iterable<T> distinct() {
    if(isNullOrEmpty()) {
      return [];
    }
    return this!.toSet().toList();
  }

  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  T? firstOrDefault(bool Function(T element) test) {
    if (isNullOrEmpty()) {
      return null;
    }

    T? item;
    try {
      item = this!.firstWhere(test);
    } catch (e) {
      return null;
    }
    return item;
  }

  Map<S, Iterable<T>> groupBy<S>(S Function(T element) key) {
    if (isNullOrEmpty()) {
      return {};
    }
    return collection.groupBy(this!, key);
  }

  double sum(double Function(T element) f) {
    if(isNullOrEmpty()) {
      return 0;
    }
    return this!.fold<double>(0.0, (previous, current) => previous + f(current));
  }

  Iterable<T>? except(Iterable<T>? elements) {
    if(isNullOrEmpty()) {
      return [];
    }

    var result = List<T>.from(this!);
    if (elements.isNullOrEmpty()) return result;

    for (var element in elements!) {
      while (result.contains(element)) {
        result.remove(element);
      }

      if (result.isEmpty) {
        break;
      }
    }
    return result;
  }

  Iterable<T> intersect(Iterable<T>? elements) {
    if(isNullOrEmpty() || elements.isNullOrEmpty()) {
      return [];
    }

    var result = <T>[];
    for (var element in elements!) {
      if(this!.contains(element)) {
        result.add(element);
      }
    }
    return result.distinct();
  }

  /// check whether `elements` are the same as current list or not, that means every element of A appears in B
  /// and every element of B appears in A
  bool isEqual(Iterable<T>? elements) {
    if(this == null) {
      return elements == null;
    }
    if(this!.isEmpty) {
      return elements?.isEmpty ?? false;
    }
    if(elements.isNullOrEmpty()) {
      return false;
    }

    return this!.every((x) => elements!.contains(x)) &&
        elements!.every((x) => this!.contains(x));
  }
}
