import 'package:lepidex/features/home/domain/entities/butterfly_entity.dart';
import 'package:lepidex/features/home/domain/repositories/details_repository.dart';

final class GetDetails {
  final DetailsRepository _detailsRepository;

  GetDetails({
    required DetailsRepository detailsRepository,
  }) : _detailsRepository = detailsRepository;

  Future<List<ButterflyEntity>> call() async {
    try {
      return await _detailsRepository.getDetails();
    } catch (e) {
      throw ("Error at DetailsRepository, error: $e");
    }
  }
}
