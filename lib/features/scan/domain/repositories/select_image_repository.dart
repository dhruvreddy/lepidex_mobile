abstract interface class SelectImageRepository {
  Future selectImageFromGallery();
  Future selectImageFromCamera();
}
