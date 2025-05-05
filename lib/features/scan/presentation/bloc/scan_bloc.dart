import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lepidex/features/scan/domain/entities/save_butterfly_entity.dart';
import 'package:lepidex/features/scan/domain/entities/scan_butterfly_entity.dart';
import 'package:lepidex/features/scan/domain/usecases/image_scan_use_case.dart';
import 'package:lepidex/features/scan/domain/usecases/save_image_use_case.dart';
import 'package:lepidex/features/scan/domain/usecases/select_image_from_camera_use_case.dart';
import 'package:lepidex/features/scan/domain/usecases/select_image_from_gallery_use_case.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final SelectImageFromCameraUseCase _selectImageFromCameraUseCase;
  final SelectImageFromGalleryUseCase _selectImageFromGalleryUseCase;
  final ImageScanUseCase _imageScanUseCase;
  final SaveImageUseCase _saveImageUseCase;

  XFile? _xFile;
  ScanButterflyEntity? _scanButterflyEntity;
  // final SaveButterflyEntity _saveButterflyEntity = SaveButterflyEntity(
  //   xFile: _xFile,
  //   commonName: _scanButterflyEntity.commonName,
  //   binomialName: _scanButterflyEntity.binomialName,
  //   domain: _scanButterflyEntity.domain,
  //   kingdom: _scanButterflyEntity.kingdom,
  //   phylum: _scanButterflyEntity.phylum,
  //   className: _scanButterflyEntity.className,
  //   order: _scanButterflyEntity.order,
  //   family: _scanButterflyEntity.family,
  //   genus: _scanButterflyEntity.genus,
  //   species: _scanButterflyEntity.species,
  // );

  ScanBloc({
    required SelectImageFromCameraUseCase selectImageFromCameraUseCase,
    required SelectImageFromGalleryUseCase selectImageFromGalleryUseCase,
    required ImageScanUseCase imageScanUseCase,
    required SaveImageUseCase saveImageUseCase,
  })  : _selectImageFromCameraUseCase = selectImageFromCameraUseCase,
        _selectImageFromGalleryUseCase = selectImageFromGalleryUseCase,
        _imageScanUseCase = imageScanUseCase,
        _saveImageUseCase = saveImageUseCase,
        super(ScanInitial()) {
    on<AddImageFromCameraEvent>(_addImageFromCameraEvent);
    on<AddImageFromGalleryEvent>(_addImageFromGalleryEvent);
    on<ImageDetailsEvent>(_imageDetailsEvent);
    on<SaveImageEvent>(_saveImageEvent);
  }

  Future<void> _addImageFromCameraEvent(AddImageFromCameraEvent event, Emitter<ScanState> emit) async {
    try {
      emit(AddImageFromCameraState());
      final XFile? xFile = await _selectImageFromCameraUseCase();
      if (xFile == null) {
        emit(ScanInitial());
        return;
      }
      _xFile = xFile;
      emit(ImageAddedFromCameraState(xFile: _xFile));
    } catch (e) {
      emit(ImageErrorState(error: e.toString()));
      throw ("Error at _addImageFromCameraEvent, error: $e");
    }
  }

  Future<void> _addImageFromGalleryEvent(AddImageFromGalleryEvent event, Emitter<ScanState> emit) async {
    try {
      emit(AddImageFromGalleryState());
      final XFile? xFile = await _selectImageFromGalleryUseCase();
      if (xFile == null) {
        emit(ScanInitial());
        return;
      }
      _xFile = xFile;
      emit(ImageAddedFromGalleryState(xFile: _xFile));
    } catch (e) {
      emit(ImageErrorState(error: e.toString()));
      throw ("Error at _addImageFromCameraEvent, error: $e");
    }
  }

  Future<void> _imageDetailsEvent(ImageDetailsEvent event, Emitter<ScanState> emit) async {
    try {
      emit(ReadyForScanState(xFile: _xFile));
      final ScanButterflyEntity scanButterflyEntity = await _imageScanUseCase(_xFile);
      _scanButterflyEntity = scanButterflyEntity;
      emit(ImageDetailsState(scanButterflyEntity: scanButterflyEntity, xFile: _xFile));
    } catch (e) {
      emit(ImageErrorState(error: e.toString()));
      throw ("Error at _imageDetailsEvent, error: $e");
    }
  }

  Future<void> _saveImageEvent(SaveImageEvent event, Emitter<ScanState> emit) async {
    try {
      emit(SaveImageState());
      if (_xFile == null || _scanButterflyEntity == null) {
        emit(ImageErrorState(error: 'No image or scan data available'));
        return;
      }
      final SaveButterflyEntity saveButterflyEntity = SaveButterflyEntity(
        path: _xFile!.path,
        commonName: _scanButterflyEntity!.commonName,
        binomialName: _scanButterflyEntity!.binomialName,
        domain: _scanButterflyEntity!.domain,
        kingdom: _scanButterflyEntity!.kingdom,
        phylum: _scanButterflyEntity!.phylum,
        className: _scanButterflyEntity!.className,
        order: _scanButterflyEntity!.order,
        family: _scanButterflyEntity!.family,
        genus: _scanButterflyEntity!.genus,
        species: _scanButterflyEntity!.species,
      );
      await _saveImageUseCase(saveButterflyEntity);
      emit(ImageSavedState());
    } catch (e) {
      emit(ImageErrorState(error: e.toString()));
      throw ("Error at _saveImageEvent, error: $e");
    }
  }
}
