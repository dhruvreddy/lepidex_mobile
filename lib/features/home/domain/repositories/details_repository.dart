import 'package:lepidex/features/home/domain/entities/butterfly_entity.dart';

abstract interface class DetailsRepository {
  Future<List<ButterflyEntity>> getDetails();
  Future<void> removeDetails();
}
