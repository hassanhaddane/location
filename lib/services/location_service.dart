class LocationService {
  final LocationApiClient locationApiClient;

  LocationService() :
      locationApiClient = LocationApiData();

  Future<List<Location>> getLocations() async {
    List<Location> list = await locationApiClient.getLocations();
    return list;
  }

  Future<Location> getLocation(int id) {
    return locationApiClient.getLocation(id);
  }
}

abstract class LocaitonApiClient {
  Future<List<Location>> getLocations();
  Future<Location> getLocation(int id);
}