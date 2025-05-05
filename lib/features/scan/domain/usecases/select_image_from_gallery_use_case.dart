import 'package:lepidex/features/scan/domain/repositories/select_image_repository.dart';

final class SelectImageFromGalleryUseCase {
  final SelectImageRepository _selectImageRepository;

  SelectImageFromGalleryUseCase({
    required SelectImageRepository selectImageRepository,
  }) : _selectImageRepository = selectImageRepository;

  Future call() async {
    return await _selectImageRepository.selectImageFromGallery();
  }
}
