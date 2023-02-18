import 'package:mcs/models/city/city_model.dart';
import 'package:mcs/models/models.dart';
import 'package:mcs/resources/data/data_repository.dart';
import 'package:mcs/services/ApiClient.dart';

class DataRepositoryImpl extends DataRepository {
  final ApiClient apiClient;

  DataRepositoryImpl({required this.apiClient});
  @override
  Future<List<CityModel>> getCities() async {
    late List<CityModel> cities;
    try {
      /// get all the cities
      cities = (await apiClient.getCityList()).data!;
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return cities;
  }

  @override
  Future<List<BannerModel>> getBanners(String cityId) async {
    late List<BannerModel> banners;
    try {
      banners = (await apiClient.getBanners({'city_id': cityId})).data!;
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return banners;
  }
}
