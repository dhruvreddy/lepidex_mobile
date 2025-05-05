import 'package:lepidex/features/scan/data/models/save_butterfly_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract interface class SaveImageLocalDataSource {
  Future saveImage(SaveButterflyModel saveButterflyModel);
}

final class SaveImageLocalDataSourceImpl implements SaveImageLocalDataSource {
  @override
  Future saveImage(SaveButterflyModel saveButterflyModel) async {
    try {
      final Box _butterflyBox = await Hive.openBox("butterfly");
      _butterflyBox.add(saveButterflyModel);
      // for (var element in _butterflyBox.keys) {
      //   print((await _butterflyBox.get(element)).commonName.toString());
      // }
    } catch (e) {
      throw ("Error at SaveImageLocalDataSource, error: $e");
    }
  }
}
