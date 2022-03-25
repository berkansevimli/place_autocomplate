import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:place_autocomplete/src/models/place_search.dart';

class PlacesService {
  final key = 'API_KEY';
  Future<List<PlaceSearch>> getAutoComplete(String search) async {
    /* var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
 */

    var url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$search&inputtype=textquery&fields=place_id,formatted_address,name,rating,opening_hours,geometry&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['candidates'] as List;
    return jsonResults.map((e) => PlaceSearch.fromJson(e)).toList();
  }
}
