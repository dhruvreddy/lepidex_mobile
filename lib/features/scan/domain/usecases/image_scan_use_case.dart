import 'package:image_picker/image_picker.dart';
import 'package:lepidex/features/scan/domain/entities/scan_butterfly_entity.dart';
import 'package:lepidex/features/scan/domain/repositories/image_scan_repository.dart';

final class ImageScanUseCase {
  final ImageScanRepository _imageScanRepository;

  ImageScanUseCase({
    required ImageScanRepository imageScanRepository,
  }) : _imageScanRepository = imageScanRepository;

  Future<ScanButterflyEntity> call(XFile? xFile) async {
    return await _imageScanRepository.getButterflyDetails(xFile);
  }
}
