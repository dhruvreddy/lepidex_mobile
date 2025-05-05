import 'package:hive_flutter/hive_flutter.dart';
import 'package:lepidex/features/home/data/models/butterfly_model.dart';
import 'package:lepidex/features/scan/data/models/save_butterfly_model.dart';

abstract interface class DetailsDataSource {
  Future<List<ButterflyModel>> getDetails();
  Future<void> removeDetails();
}

final class DetailsRepositoryDataSourceImpl implements DetailsDataSource {
  @override
  Future<List<ButterflyModel>> getDetails() async {
    try {
      final Box _butterflyBox = await Hive.openBox("butterfly");
      List<ButterflyModel> butterflyModels = [];

      for (var key in _butterflyBox.keys) {
        SaveButterflyModel saveButterflyModel = _butterflyBox.get(key);
        ButterflyModel butterflyModel = ButterflyModel(
          path: saveButterflyModel.path,
          commonName: saveButterflyModel.commonName,
          binomialName: saveButterflyModel.binomialName,
          domain: saveButterflyModel.domain,
          kingdom: saveButterflyModel.kingdom,
          phylum: saveButterflyModel.phylum,
          className: saveButterflyModel.className,
          order: saveButterflyModel.order,
          family: saveButterflyModel.family,
          genus: saveButterflyModel.genus,
          species: saveButterflyModel.species,
        );
        butterflyModels.add(butterflyModel);
      }

      return butterflyModels;
    } on Exception catch (e) {
      throw ("Error at DetailsDataSource, error: $e");
    }
  }

  @override
  Future<void> removeDetails() async {
    try {
      final Box _butterflyBox = await Hive.openBox("butterfly");
      for (var key in _butterflyBox.keys) {
        _butterflyBox.delete(key);
      }
    } on Exception catch (e) {
      throw ("Error at DetailsDataSource, error: $e");
    }
  }
}
