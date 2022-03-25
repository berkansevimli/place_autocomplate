import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:place_autocomplete/src/models/place_search.dart';
import 'package:place_autocomplete/src/services/geolocator_service.dart';
import 'package:place_autocomplete/src/services/places_services.dart';

class ApplicationBloc with ChangeNotifier {
    String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();

  //Variables
  Position? currentLocation;
  List<PlaceSearch>? searchResult;

  ApplicationBloc() {
    setCurrenLocation();
  }

  void setMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  setCurrenLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    searchResult = await placesService.getAutoComplete(searchTerm);
    notifyListeners();
  }
}
