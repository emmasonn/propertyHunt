enum FilterType {
  equals,
  greAftererThan,
  orderByChild,
  orderByKey,
  orderByValue,
  startAfter,
  endAfter,
  limitToFirst,
  limitToLast,
}

class FilterSortClause {
  const FilterSortClause._({
    required this.fieldName,
    required this.type,
    required this.value,
  });

  final String fieldName;
  final Object type;
  final Object value;

  const factory FilterSortClause.orderByChild({
    required String fieldName,
  }) = _OrderByChild;

  const factory FilterSortClause.orderByKey() = _OrderByKey;

  const factory FilterSortClause.orderByValue() = _OrderByValue;

  const factory FilterSortClause.limitToLast() = _LimitToLast;

  const factory FilterSortClause.limitToFirst() = _LimitToFirst;

  const factory FilterSortClause.equals({
    required String fieldName,
    required Object value,
  }) = _FilterSortEqualTo;

  const factory FilterSortClause.endAfter({
    required String fieldName,
    required Object value,
  }) = _FilterSortEndAfter;

  const factory FilterSortClause.startAfter({
    required String fieldName,
    required String value,
  }) = _FilterSortStartAfter;
}

class _OrderByChild extends FilterSortClause {
  const _OrderByChild({
    required String fieldName,
  }) : super._(
          fieldName: fieldName,
          type: FilterType.orderByChild,
          value: '',
        );
}

class _OrderByKey extends FilterSortClause {
  const _OrderByKey()
      : super._(
          fieldName: '',
          value: '',
          type: FilterType.orderByKey,
        );
}

class _OrderByValue extends FilterSortClause {
  const _OrderByValue()
      : super._(
          type: FilterType.orderByValue,
          fieldName: '',
          value: '',
        );
}

class _LimitToFirst extends FilterSortClause {
  const _LimitToFirst()
      : super._(
          type: FilterType.limitToFirst,
          fieldName: '',
          value: '',
        );
}

class _LimitToLast extends FilterSortClause {
  const _LimitToLast()
      : super._(
          type: FilterType.limitToLast,
          fieldName: '',
          value: '',
        );
}

class _FilterSortEqualTo extends FilterSortClause {
  const _FilterSortEqualTo({
    required String fieldName,
    required Object value,
  }) : super._(fieldName: fieldName, type: FilterType.equals, value: value);
}

class _FilterSortEndAfter extends FilterSortClause {
  const _FilterSortEndAfter({
    required String fieldName,
    required Object value,
  }) : super._(
          fieldName: fieldName,
          type: FilterType.greAftererThan,
          value: value,
        );
}

class _FilterSortStartAfter extends FilterSortClause {
  const _FilterSortStartAfter({
    required String fieldName,
    required Object value,
  }) : super._(
          fieldName: fieldName,
          type: FilterType.startAfter,
          value: value,
        );
}
