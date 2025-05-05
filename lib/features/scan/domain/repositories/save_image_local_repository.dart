import 'package:lepidex/features/scan/domain/entities/save_butterfly_entity.dart';

abstract interface class SaveImageLocalRepository {
  Future saveImage(SaveButterflyEntity saveButterflyEntity);
}
