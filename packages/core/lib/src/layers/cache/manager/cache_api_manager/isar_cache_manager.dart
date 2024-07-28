import 'package:core/src/layers/cache/constants/enum/cache_api_manager_type.dart';
import 'package:core/src/layers/cache/interface/ICacheApiManager.dart';
import 'package:core/src/layers/cache/interface/ICacheModel.dart';
import 'package:core/src/utils/id_utils.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarCacheManager extends ICacheApiManager {
  IsarCacheManager({
    super.type = CacheApiManagerType.Isar,
    super.isDefault,
    this.isarSchemas,
  }) {
    init();
  }

  List<CollectionSchema<dynamic>>? isarSchemas;

  @override
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    await Isar.open(
      isarSchemas ?? [],
      directory: dir.path,
    );
  }

  Isar _getInstance() {
    final isarInstance = Isar.getInstance();
    if (isarInstance != null) {
      return isarInstance;
    } else {
      throw Exception('Isar is not initialized');
    }
  }

  IsarCollection<T> _getCollection<T>() {
    return _getInstance().collection<T>();
  }

  @override
  Future<T> create<T extends ICacheModel<T>>(T model) async {
    final result = await _getInstance().writeTxn<T>(() async {
      final updatedModel = model.copyWith(id: IdUtils.instance.createIsarId);
      await _getCollection<T>().put(updatedModel);
      return updatedModel;
    });
    return result;
  }

  @override
  Future<T?> get<T extends ICacheModel<T>>({
    int? id,
    String? key,
    T? parseModel,
  }) async {
    if (id == null) {
      throw Exception('Id is null');
    }
    print(id);
    return _getCollection<T>().get(id);
  }

  @override
  Future<List<T>> getAll<T extends ICacheModel<T>>({
    T? parseModel,
  }) async {
    return _getCollection<T>().where().findAll();
  }

  @override
  Future<T> update<T extends ICacheModel<T>>(T model) async {
    final result = await _getInstance().writeTxn<T>(() async {
      await _getCollection<T>().put(model);
      return model;
    });
    return result;
  }

  @override
  Future<bool> delete<T extends ICacheModel<T>>({int? id, String? key}) async {
    if (id == null) {
      throw Exception('Id is null');
    }
    var result = false;
    await _getInstance().writeTxn(() async {
      result = await _getCollection<T>().delete(id);
    });
    return result;
  }
}
