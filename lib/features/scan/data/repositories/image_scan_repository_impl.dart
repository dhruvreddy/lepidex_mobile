import 'package:image_picker/image_picker.dart';
import 'package:lepidex/features/scan/data/datasources/image_scan_data_source.dart';
import 'package:lepidex/features/scan/data/models/scan_butterfly_model.dart';
import 'package:lepidex/features/scan/domain/entities/scan_butterfly_entity.dart';
import 'package:lepidex/features/scan/domain/repositories/image_scan_repository.dart';

final class ImageScanRepositoryImpl implements ImageScanRepository {
  final ImageScanDataSource _imageScanDataSource;

  ImageScanRepositoryImpl({required ImageScanDataSource imageScanDataSource})
      : _imageScanDataSource = imageScanDataSource;

  @override
  Future<ScanButterflyEntity> getButterflyDetails(XFile? xFile) async {
    try {
      final ScanButterflyModel scanButterflyModel = await _imageScanDataSource.getButterflyDetails(xFile);
      return ScanButterflyEntity.fromModel(scanButterflyModel);
    } catch (e) {
      throw ("Error at ImageScanDataSource, error: $e");
    }
  }
}
