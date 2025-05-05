import 'package:lepidex/features/home/data/datasources/details_data_source.dart';
import 'package:lepidex/features/home/domain/entities/butterfly_entity.dart';
import 'package:lepidex/features/home/domain/repositories/details_repository.dart';

final class DetailsRepositoryImpl implements DetailsRepository {
  final DetailsDataSource _detailsDataSource;

  DetailsRepositoryImpl({
    required DetailsDataSource detailsDataSource,
  }) : _detailsDataSource = detailsDataSource;

  @override
  Future<List<ButterflyEntity>> getDetails() async {
    try {
      final butterflyModels = await _detailsDataSource.getDetails();
      return butterflyModels
          .where((model) => model != null)
          .map(
            (model) => ButterflyEntity.fromModel(model!),
          )
          .toList();
    } catch (e) {
      throw ("Error at DetailsRepository, error: $e");
    }
  }

  @override
  Future<void> removeDetails() async {
    try {
      await _detailsDataSource.removeDetails();
    } catch (e) {
      throw ("Error at DetailsRepository, error: $e");
    }
  }
}
