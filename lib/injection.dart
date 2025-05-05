import 'package:get_it/get_it.dart';

import 'package:image_picker/image_picker.dart';
import 'package:lepidex/core/network/dio_client.dart';
import 'package:lepidex/features/home/data/datasources/details_data_source.dart';
import 'package:lepidex/features/home/data/repositories/details_repository_impl.dart';
import 'package:lepidex/features/home/domain/repositories/details_repository.dart';
import 'package:lepidex/features/home/domain/usecases/delete_details.dart';
import 'package:lepidex/features/home/domain/usecases/get_details.dart';
import 'package:lepidex/features/home/presentation/bloc/home_bloc.dart';
import 'package:lepidex/features/scan/data/datasources/image_scan_data_source.dart';
import 'package:lepidex/features/scan/data/datasources/save_image_local_data_source.dart';
import 'package:lepidex/features/scan/data/datasources/select_image_data_source.dart';
import 'package:lepidex/features/scan/data/repositories/image_scan_repository_impl.dart';
import 'package:lepidex/features/scan/data/repositories/save_image_local_repository_impl.dart';
import 'package:lepidex/features/scan/data/repositories/select_image_repository_impl.dart';
import 'package:lepidex/features/scan/domain/repositories/image_scan_repository.dart';
import 'package:lepidex/features/scan/domain/repositories/save_image_local_repository.dart';
import 'package:lepidex/features/scan/domain/repositories/select_image_repository.dart';
import 'package:lepidex/features/scan/domain/usecases/image_scan_use_case.dart';
import 'package:lepidex/features/scan/domain/usecases/save_image_use_case.dart';
import 'package:lepidex/features/scan/domain/usecases/select_image_from_camera_use_case.dart';
import 'package:lepidex/features/scan/domain/usecases/select_image_from_gallery_use_case.dart';
import 'package:lepidex/features/scan/presentation/bloc/scan_bloc.dart';

final GetIt injection = GetIt.instance;

void setup() {
  injection.registerSingleton<ImagePicker>(
    ImagePicker(),
  );

  injection.registerSingleton<SelectImageDataSource>(
    SelectImageDataSourceImpl(imagePicker: injection<ImagePicker>()),
  );

  injection.registerSingleton<SelectImageRepository>(
    SelectImageRepositoryImpl(
      selectImageDataSource: injection<SelectImageDataSource>(),
    ),
  );

  injection.registerSingleton<ImageScanDataSource>(
    ImageScanDataSourceImpl(dio: DioClient.getDioScan),
  );

  injection.registerSingleton<ImageScanRepository>(
    ImageScanRepositoryImpl(
      imageScanDataSource: injection<ImageScanDataSource>(),
    ),
  );

  injection.registerSingleton<SelectImageFromGalleryUseCase>(
    SelectImageFromGalleryUseCase(selectImageRepository: injection<SelectImageRepository>()),
  );

  injection.registerSingleton<SelectImageFromCameraUseCase>(
    SelectImageFromCameraUseCase(selectImageRepository: injection<SelectImageRepository>()),
  );

  injection.registerSingleton<ImageScanUseCase>(
    ImageScanUseCase(imageScanRepository: injection<ImageScanRepository>()),
  );

  injection.registerLazySingleton<SaveImageLocalDataSource>(() {
    return SaveImageLocalDataSourceImpl();
  });

  injection.registerLazySingleton<SaveImageLocalRepository>(() {
    return SaveImageLocalRepositoryImpl(
      saveImageLocalDataSource: injection<SaveImageLocalDataSource>(),
    );
  });

  injection.registerLazySingleton<SaveImageUseCase>(
    () => SaveImageUseCase(imageLocalRepository: injection<SaveImageLocalRepository>()),
  );

  injection.registerSingleton<ScanBloc>(ScanBloc(
    imageScanUseCase: injection<ImageScanUseCase>(),
    selectImageFromCameraUseCase: injection<SelectImageFromCameraUseCase>(),
    selectImageFromGalleryUseCase: injection<SelectImageFromGalleryUseCase>(),
    saveImageUseCase: injection<SaveImageUseCase>(),
  ));

  injection.registerLazySingleton<DetailsDataSource>(() => DetailsRepositoryDataSourceImpl());
  injection.registerLazySingleton<DetailsRepository>(
    () => DetailsRepositoryImpl(detailsDataSource: injection<DetailsDataSource>()),
  );

  injection.registerLazySingleton<GetDetails>(
    () => GetDetails(detailsRepository: injection<DetailsRepository>()),
  );

  injection.registerLazySingleton<DeleteDetails>(
    () => DeleteDetails(detailsRepository: injection<DetailsRepository>()),
  );

  injection.registerSingleton<HomeBloc>(
    HomeBloc(getDetails: injection<GetDetails>(), deleteDetails: injection<DeleteDetails>()),
  );

  injection.registerSingleton<DioClient>(DioClient());
}
