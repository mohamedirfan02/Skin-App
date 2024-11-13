import 'package:flutter/foundation.dart';

abstract class ResourceNotifier<T> with ChangeNotifier {
  T? _value;

  T? get value => _value;

  set value(T? newValue) {
    _value = newValue;
    notifyListeners();
  }

  Future<void> load();
}

abstract class ResourceWithDependencyNotifier<T, D>
    extends ResourceNotifier<T> {
  ResourceWithDependencyNotifier(T? value) : super();

  @override
  Future<void> load([D? val]) async {}
}
