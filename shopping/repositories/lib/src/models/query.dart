import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:jars/jars.dart';

enum DescendingSortBy {
  mrp('mrp'),
  discount('discount'),
  rating('rating'),
  reviews('totalReviews');

  final String field;
  const DescendingSortBy(this.field);
}

sealed class Query {
  /// The field or [FieldPath] to filter on.
  Object get field;
  fs.Filter applyFilter();
  const Query();

  static fs.Filter combineFilter(List<Query> queries) {
    if (queries.length == 1) return queries.first.applyFilter();

    List<fs.Filter?> qs = List.filled(10, null);
    for (var i = 0; i < queries.length; i++) {
      qs[i] = queries[i].applyFilter();
    }
    return fs.Filter.and(qs[0]!, qs[1]!, qs[2], qs[3], qs[4], qs[5], qs[6], qs[7], qs[8], qs[9]);
  }
}

final class ReplacementQuery extends Query {
  @override
  Object get field => 'replacement';
  @override
  fs.Filter applyFilter() => fs.Filter(field, isNull: false);
}

final class RefundQuery extends Query {
  @override
  Object get field => 'refund';
  @override
  fs.Filter applyFilter() => fs.Filter(field, isNull: false);
}

final class ProductIdsQuery extends Query {
  final List<String> productIds;

  const ProductIdsQuery(this.productIds);

  @override
  Object get field => fs.FieldPath.documentId;

  @override
  fs.Filter applyFilter() => fs.Filter(field, whereIn: productIds);
}

final class AfterSalesServiceQuery extends Query {
  final String seviceId;

  const AfterSalesServiceQuery(this.seviceId);

  @override
  Object get field => 'afterSalesServiceId';
  @override
  fs.Filter applyFilter() => fs.Filter(field, isNull: false, isEqualTo: seviceId);
}

final class KeywordQuery extends Query {
  final List<String> value;
  const KeywordQuery(this.value);

  @override
  Object get field => 'keywords';
  @override
  fs.Filter applyFilter() =>
      fs.Filter(field, arrayContainsAny: value.map((e) => e.removeAllSpace.toLowerCase()).toList());
}

final class CategoriesQuery extends Query {
  final List<String> value;

  const CategoriesQuery(this.value);

  @override
  Object get field => 'category';
  @override
  fs.Filter applyFilter() =>
      fs.Filter(field, arrayContainsAny: value.map((e) => e.removeAllSpace.toLowerCase()).toList());
}

final class DiscountQuery extends Query {
  final int discount;
  const DiscountQuery(this.discount);

  @override
  Object get field => 'discount';
  @override
  fs.Filter applyFilter() => fs.Filter(field, isGreaterThanOrEqualTo: discount);
}

final class PriceQuery extends Query {
  final int min, max;

  const PriceQuery(this.min, this.max);

  @override
  Object get field => 'mrp';

  @override
  fs.Filter applyFilter() => fs.Filter(field, isGreaterThanOrEqualTo: min, isLessThanOrEqualTo: max);
}

final class FeaturesQuery extends Query {
  final List<String> value;

  const FeaturesQuery(this.value);

  @override
  Object get field => 'features';
  @override
  fs.Filter applyFilter() => fs.Filter(field, arrayContainsAny: value);
}

final class RatingQuery extends Query {
  final int isGreaterThan;
  const RatingQuery(this.isGreaterThan);

  @override
  Object get field => 'rating';
  @override
  fs.Filter applyFilter() => fs.Filter(field, isGreaterThan: isGreaterThan);
}

final class ReviewQuery extends Query {
  final List<String> isGreaterThan;

  const ReviewQuery(this.isGreaterThan);

  @override
  Object get field => 'totalReviews';
  @override
  fs.Filter applyFilter() => fs.Filter(field, isGreaterThanOrEqualTo: isGreaterThan);
}
