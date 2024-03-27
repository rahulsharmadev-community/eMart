sealed class Query {}

class ReplacementQuery extends Query {}

class RefundQuery extends Query {}

class AfterSalesServiceQuery extends Query {}

class KeywordQuery extends Query {
  final List<String> value;
  KeywordQuery(this.value);
}

class CategoriesQuery extends Query {
  final List<String> value;

  CategoriesQuery(this.value);
}

class DiscountQuery extends Query {
  final int discount;
  DiscountQuery(this.discount);
}

class PriceQuery extends Query {
  final int min, max;

  PriceQuery(this.min, this.max);
}

class FeaturesQuery extends Query {
  final List<String> value;

  FeaturesQuery(this.value);
}
