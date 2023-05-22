import 'package:mcs/resources/location/location_repository.dart';

import '../../models/models.dart' show BaseResponse, CityModel, ServerError;
import '../../services/ApiClient.dart';

class LocationRepositoryimpl extends LocationRepository {
  final ApiClient apiClient;

  LocationRepositoryimpl({required this.apiClient});
  @override
  Future<BaseResponse<CityModel>> getCurrentCity(
      Map<String, dynamic> data) async {
    late BaseResponse<CityModel> cityModel;
    try {
      cityModel = await apiClient.getCurrentCity(data);
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return cityModel;
  }
}
