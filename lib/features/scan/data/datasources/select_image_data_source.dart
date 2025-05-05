import 'package:image_picker/image_picker.dart';

abstract interface class SelectImageDataSource {
  Future selectImageFromGallery();
  Future selectImageFromCamera();
}

final class SelectImageDataSourceImpl implements SelectImageDataSource {
  final ImagePicker _imagePicker;

  SelectImageDataSourceImpl({required ImagePicker imagePicker}) : _imagePicker = imagePicker;

  @override
  Future selectImageFromCamera() async {
    try {
      final XFile? xfile = await _imagePicker.pickImage(source: ImageSource.camera);
      if (xfile == null) {
        return;
      }
      return xfile;
    } on Exception catch (e) {
      throw ("Error at SelectImageDataSourceImpl, Error: $e");
    }
  }

  @override
  Future selectImageFromGallery() async {
    try {
      final XFile? xfile = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (xfile == null) {
        return;
      }
      return xfile;
    } on Exception catch (e) {
      throw ("Error at SelectImageDataSourceImpl, Error: $e");
    }
  }
}
