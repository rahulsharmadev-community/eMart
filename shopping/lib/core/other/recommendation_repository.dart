import "package:hydrated_bloc/hydrated_bloc.dart";
import 'package:jars/jars.dart';

class RecommendationRepository extends HydratedCubit<JSON<DateTime>> {
  RecommendationRepository() : super(const {});

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

  bool get _checkOverFlow => state.length >= 500;

  @override
  JSON<DateTime>? fromJson(JSON json) =>
      json.map((key, value) => MapEntry(key, DateTime.fromMillisecondsSinceEpoch(value)));
  @override
  JSON? toJson(JSON<DateTime> state) =>
      state.map((key, value) => MapEntry(key, value.millisecondsSinceEpoch));
}
