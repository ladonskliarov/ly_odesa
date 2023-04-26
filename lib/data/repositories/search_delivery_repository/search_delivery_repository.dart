abstract class SearchDeliveryRepository {
  late Set<String> citiesOfOnlineSearch;
  late List<String> postOffices;
  late List<String> postOfficesResultOfSearch;
  late String choosenCity;

  Future fetchPostOffices({required String postOffice});
  Future searchCityOnline({required String city});
}
