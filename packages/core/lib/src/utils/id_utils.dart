class IdUtils {
  IdUtils._init();
  static IdUtils? _instance;
  static final IdUtils instance = _instance ??= IdUtils._init();

  String get createStringId {
    return '${DateTime.now().microsecondsSinceEpoch}';
  }

  int get createIntId {
    final idValue = '${DateTime.now().microsecondsSinceEpoch}';
    return int.parse(idValue);
  }

  int get createIsarId {
    return createIntId;
  }
}
