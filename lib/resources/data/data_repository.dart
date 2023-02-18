import 'package:mcs/models/models.dart' show CityModel, BannerModel;

abstract class DataRepository {
  Future<List<CityModel>> getCities();
  Future<List<BannerModel>> getBanners(String cityId);
}
