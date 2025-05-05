import 'package:lepidex/features/scan/domain/repositories/select_image_repository.dart';

final class SelectImageFromCameraUseCase {
  final SelectImageRepository _selectImageRepository;

  SelectImageFromCameraUseCase({
    required SelectImageRepository selectImageRepository,
  }) : _selectImageRepository = selectImageRepository;

  Future call() async {
    return await _selectImageRepository.selectImageFromCamera();
  }
}
