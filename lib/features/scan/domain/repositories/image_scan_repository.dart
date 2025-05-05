import 'package:image_picker/image_picker.dart';

abstract interface class ImageScanRepository {
  Future getButterflyDetails(XFile? xFile) async {}
}
