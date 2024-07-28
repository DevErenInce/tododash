import 'package:core/core.dart';

abstract class BaseNetworkQueryModel<T> {
  const BaseNetworkQueryModel();

  T getQuery(NetworkQueryModel<dynamic> query) {
    switch (query.type) {
      case NetworkQueryType.select:
        return select(query);
      case NetworkQueryType.and:
        return and(query);
      case NetworkQueryType.or:
        return or(query);
      case NetworkQueryType.equal:
        return equal(query);
      case NetworkQueryType.notEqual:
        return notEqual(query);
      case NetworkQueryType.lessThan:
        return lessThan(query);
      case NetworkQueryType.lessThanEqual:
        return lessThanEqual(query);
      case NetworkQueryType.greaterThan:
        return greaterThan(query);
      case NetworkQueryType.greaterThanEqual:
        return greaterThanEqual(query);
      case NetworkQueryType.between:
        return between(query);
      case NetworkQueryType.isNull:
        return isNull(query);
      case NetworkQueryType.isNotNull:
        return isNotNull(query);
      case NetworkQueryType.startsWith:
        return startsWith(query);
      case NetworkQueryType.endsWith:
        return endsWith(query);
      case NetworkQueryType.contains:
        return contains(query);
      case NetworkQueryType.search:
        return search(query);
      case NetworkQueryType.orderDesc:
        return orderDesc(query);
      case NetworkQueryType.orderAsc:
        return orderAsc(query);
      case NetworkQueryType.limit:
        return limit(query);
      case NetworkQueryType.offset:
        return offset(query);
      case NetworkQueryType.cursorAfter:
        return cursorAfter(query);
      case NetworkQueryType.cursorBefore:
        return cursorBefore(query);
    }
  }

  T select(NetworkQueryModel<dynamic> query);
  T and(NetworkQueryModel<dynamic> query);
  T or(NetworkQueryModel<dynamic> query);
  T equal(NetworkQueryModel<dynamic> query);
  T notEqual(NetworkQueryModel<dynamic> query);
  T lessThan(NetworkQueryModel<dynamic> query);
  T lessThanEqual(NetworkQueryModel<dynamic> query);
  T greaterThan(NetworkQueryModel<dynamic> query);
  T greaterThanEqual(NetworkQueryModel<dynamic> query);
  T between(NetworkQueryModel<dynamic> query);
  T isNull(NetworkQueryModel<dynamic> query);
  T isNotNull(NetworkQueryModel<dynamic> query);
  T startsWith(NetworkQueryModel<dynamic> query);
  T endsWith(NetworkQueryModel<dynamic> query);
  T contains(NetworkQueryModel<dynamic> query);
  T search(NetworkQueryModel<dynamic> query);
  T orderDesc(NetworkQueryModel<dynamic> query);
  T orderAsc(NetworkQueryModel<dynamic> query);
  T limit(NetworkQueryModel<dynamic> query);
  T offset(NetworkQueryModel<dynamic> query);
  T cursorAfter(NetworkQueryModel<dynamic> query);
  T cursorBefore(NetworkQueryModel<dynamic> query);
}
