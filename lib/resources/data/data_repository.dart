import 'package:mcs/models/models.dart' show CityModel;

abstract class DataRepository {
  Future<List<CityModel>> getCities();
}
