import 'package:lepidex/features/scan/data/datasources/save_image_local_data_source.dart';
import 'package:lepidex/features/scan/data/models/save_butterfly_model.dart';
import 'package:lepidex/features/scan/domain/entities/save_butterfly_entity.dart';
import 'package:lepidex/features/scan/domain/repositories/save_image_local_repository.dart';

final class SaveImageLocalRepositoryImpl implements SaveImageLocalRepository {
  final SaveImageLocalDataSource _saveImageLocalDataSource;

  SaveImageLocalRepositoryImpl({
    required SaveImageLocalDataSource saveImageLocalDataSource,
  }) : _saveImageLocalDataSource = saveImageLocalDataSource;

  @override
  Future saveImage(SaveButterflyEntity saveButterflyEntity) async {
    try {
      final SaveButterflyModel saveButterflyModel = SaveButterflyModel.fromModel(saveButterflyEntity);
      await _saveImageLocalDataSource.saveImage(saveButterflyModel);
    } catch (e) {
      throw ("Error at SaveImageLocalRepository, error: $e");
    }
  }
}
