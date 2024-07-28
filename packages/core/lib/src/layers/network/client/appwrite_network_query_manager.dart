import 'package:appwrite/appwrite.dart';
import 'package:core/core.dart';
import 'package:core/src/layers/network/classes/base/base_network_query_model.dart';

class AppWriteNetworkQueryClient extends BaseNetworkQueryModel<String> {
  const AppWriteNetworkQueryClient();

  @override
  String select(NetworkQueryModel<dynamic> query) {
    if (query.value is List<String>) {
      return Query.select(query.value as List<String>);
    } else {
      throw Exception(
        'Invalid value for select query. Please set value type List<String>',
      );
    }
  }

  @override
  String and(NetworkQueryModel<dynamic> query) {
    if (query.value is List<NetworkQueryModel<dynamic>>) {
      final queryValueList = query.value as List<NetworkQueryModel<dynamic>>;
      final queryStringList = <String>[];

      for (final queryItem in queryValueList) {
        queryStringList.add(getQuery(queryItem));
      }

      return Query.and(queryStringList);
    } else {
      throw Exception(
        'Invalid value for and query. Please set value type List<NetworkQuery<dynamic>>',
      );
    }
  }

  @override
  String or(NetworkQueryModel<dynamic> query) {
    if (query.value is List<NetworkQueryModel<dynamic>>) {
      final queryValueList = query.value as List<NetworkQueryModel<dynamic>>;
      final queryStringList = <String>[];

      for (final queryItem in queryValueList) {
        queryStringList.add(getQuery(queryItem));
      }

      return Query.or(queryStringList);
    } else {
      throw Exception(
        'Invalid value for or query. Please set value type List<NetworkQuery<dynamic>>',
      );
    }
  }

  @override
  String equal(NetworkQueryModel<dynamic> query) {
    return Query.equal(query.key, query.value);
  }

  @override
  String notEqual(NetworkQueryModel<dynamic> query) {
    return Query.notEqual(query.key, query.value);
  }

  @override
  String lessThan(NetworkQueryModel<dynamic> query) {
    return Query.lessThan(query.key, query.value);
  }

  @override
  String lessThanEqual(NetworkQueryModel<dynamic> query) {
    return Query.lessThanEqual(query.key, query.value);
  }

  @override
  String greaterThan(NetworkQueryModel<dynamic> query) {
    return Query.greaterThan(query.key, query.value);
  }

  @override
  String greaterThanEqual(NetworkQueryModel<dynamic> query) {
    return Query.greaterThanEqual(query.key, query.value);
  }

  @override
  String between(NetworkQueryModel<dynamic> query) {
    if (query.value is List<dynamic>) {
      final valueList = query.value as List<dynamic>;
      if (valueList.length == 2) {
        return Query.between(query.key, valueList[0], valueList[1]);
      } else {
        throw Exception(
          'Invalid value for between query. Please set value type List<dynamic> with length 2',
        );
      }
    } else {
      throw Exception(
        'Invalid value for between query. Please set value type List<dynamic>',
      );
    }
  }

  @override
  String isNull(NetworkQueryModel<dynamic> query) {
    return Query.isNull(query.key);
  }

  @override
  String isNotNull(NetworkQueryModel<dynamic> query) {
    return Query.isNotNull(query.key);
  }

  @override
  String startsWith(NetworkQueryModel<dynamic> query) {
    if (query.value is String) {
      final value = query.value as String;
      return Query.startsWith(query.key, value);
    } else {
      throw Exception(
        'Invalid value for startsWith query. Please set value type String',
      );
    }
  }

  @override
  String endsWith(NetworkQueryModel<dynamic> query) {
    if (query.value is String) {
      final value = query.value as String;
      return Query.endsWith(query.key, value);
    } else {
      throw Exception(
        'Invalid value for endsWith query. Please set value type String',
      );
    }
  }

  @override
  String contains(NetworkQueryModel<dynamic> query) {
    return Query.contains(query.key, query.value);
  }

  @override
  String search(NetworkQueryModel<dynamic> query) {
    if (query.value is String) {
      final value = query.value as String;
      return Query.search(query.key, value);
    } else {
      throw Exception(
        'Invalid value for search query. Please set value type String',
      );
    }
  }

  @override
  String orderDesc(NetworkQueryModel<dynamic> query) {
    return Query.orderDesc(query.key);
  }

  @override
  String orderAsc(NetworkQueryModel<dynamic> query) {
    return Query.orderAsc(query.key);
  }

  @override
  String limit(NetworkQueryModel<dynamic> query) {
    if (query.value is int) {
      final value = query.value as int;
      return Query.limit(value);
    } else {
      throw Exception(
        'Invalid value for limit query. Please set value type int',
      );
    }
  }

  @override
  String offset(NetworkQueryModel<dynamic> query) {
    if (query.value is int) {
      final value = query.value as int;
      return Query.offset(value);
    } else {
      throw Exception(
        'Invalid value for offset query. Please set value type int',
      );
    }
  }

  @override
  String cursorAfter(NetworkQueryModel<dynamic> query) {
    if (query.value is String) {
      final value = query.value as String;
      return Query.cursorAfter(value);
    } else {
      throw Exception(
        'Invalid value for cursorAfter query. Please set value(id) type String',
      );
    }
  }

  @override
  String cursorBefore(NetworkQueryModel<dynamic> query) {
    if (query.value is String) {
      final value = query.value as String;
      return Query.cursorBefore(value);
    } else {
      throw Exception(
        'Invalid value for cursorBefore query. Please set value(id) type String',
      );
    }
  }
}
