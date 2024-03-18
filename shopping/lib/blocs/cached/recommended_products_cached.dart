import "package:hydrated_bloc/hydrated_bloc.dart";
import "package:jars/extensions.dart";
import "package:shared/models.dart";
import "package:shopping/blocs/cached/cached_limit.dart";

// key: product_id
// value: last response DateTime
class RecommendedProductsCached extends HydratedCubit<JSON<DateTime>> {
  RecommendedProductsCached() : super(const {});

  List<String> get getProducts => state.keys.toList()..shuffle();

  void add(List<String> list) {
    _removeOldProducts();
    if (list.isEmpty || _checkOverFlow) return;
    final now = DateTime.now();
    final temp = {...state};
    for (var e in list) {
      temp[e] = now;
    }
    emit(temp);
  }

  void _removeOldProducts() {
    if (state.isEmpty) return;
    final temp = {...state};
    final threshold = DateTime.now().subtract(60.days);
    temp.removeWhere((k, v) => v < threshold);
    emit(temp);
  }

  bool get _checkOverFlow => state.length >= recommendedCachedLimit;

  @override
  JSON<DateTime>? fromJson(Map<String, dynamic> json) =>
      json.map((key, value) => MapEntry(key, DateTime.fromMillisecondsSinceEpoch(value)));
  @override
  Map<String, dynamic>? toJson(JSON<DateTime> state) =>
      state.map((key, value) => MapEntry(key, value.millisecondsSinceEpoch));
}
