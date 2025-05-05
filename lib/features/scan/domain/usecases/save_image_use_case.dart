import 'package:lepidex/features/scan/domain/entities/save_butterfly_entity.dart';
import 'package:lepidex/features/scan/domain/repositories/save_image_local_repository.dart';

final class SaveImageUseCase {
  final SaveImageLocalRepository _imageLocalRepository;

  SaveImageUseCase({
    required SaveImageLocalRepository imageLocalRepository,
  }) : _imageLocalRepository = imageLocalRepository;

  Future call(SaveButterflyEntity saveButterflyEntity) async {
    try {
      await _imageLocalRepository.saveImage(saveButterflyEntity);
    } catch (e) {
      throw ("Error at SaveImageUseCase, error: $e");
    }
  }
}
