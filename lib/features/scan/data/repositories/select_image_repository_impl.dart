import '../datasources/select_image_data_source.dart';
import '../../domain/repositories/select_image_repository.dart';

final class SelectImageRepositoryImpl implements SelectImageRepository {
  final SelectImageDataSource _selectImageDataSource;

  SelectImageRepositoryImpl({required SelectImageDataSource selectImageDataSource})
    : _selectImageDataSource = selectImageDataSource;

  @override
  Future selectImageFromCamera() async {
    try {
      return await _selectImageDataSource.selectImageFromCamera();
    } catch (e) {
      throw ("Error at SelectImageRepositoryImpl , Error: $e");
    }
  }

  @override
  Future selectImageFromGallery() async {
    try {
      return await _selectImageDataSource.selectImageFromGallery();
    } catch (e) {
      throw ("Error at SelectImageRepositoryImpl , Error: $e");
    }
  }
}
