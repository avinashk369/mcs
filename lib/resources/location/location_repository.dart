import '../../models/models.dart' show BaseResponse, CityModel;

abstract class LocationRepository {
  Future<BaseResponse<CityModel>> getCurrentCity(Map<String, dynamic> data);
}
