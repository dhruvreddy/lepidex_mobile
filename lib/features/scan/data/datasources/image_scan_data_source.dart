import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lepidex/features/scan/data/models/scan_butterfly_model.dart';

abstract interface class ImageScanDataSource {
  Future<ScanButterflyModel> getButterflyDetails(XFile? xFile);
}

final class ImageScanDataSourceImpl implements ImageScanDataSource {
  final Dio _dio;

  ImageScanDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<ScanButterflyModel> getButterflyDetails(XFile? xFile) async {
    try {
      final FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(xFile!.path, filename: xFile.name),
      });
      final Response response = await _dio.post("/scan", data: formData);
      return ScanButterflyModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("Error at ImageScanDataSource: $e");
    }
  }
}
