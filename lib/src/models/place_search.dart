class PlaceSearch {
  final String description;
  final String placeId;
  final String adress;

  PlaceSearch(
    this.description,
    this.placeId, this.adress,
  );

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(json['name'], json['place_id'],json['formatted_address']);
  }
}
