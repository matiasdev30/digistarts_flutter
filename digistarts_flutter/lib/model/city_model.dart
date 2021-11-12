class CityModel {
  CityModel({
    required this.city,
    required this.cityIbgeCode,
    required this.confirmed,
    required this.confirmedPer_100kInhabitants,
    required this.date,
    required this.deathRate,
    required this.deaths,
    required this.estimatedPopulation,
    required this.estimatedPopulation_2019,
    required this.isLast,
    required this.orderForPlace,
    required this.placeType,
    required this.state,
  });
  late final String city;
  late final String cityIbgeCode;
  late final int confirmed;
  late final double confirmedPer_100kInhabitants;
  late final String date;
  late final double deathRate;
  late final int deaths;
  late final int estimatedPopulation;
  late final int estimatedPopulation_2019;
  late final bool isLast;
  late final int orderForPlace;
  late final String placeType;
  late final String state;

  CityModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    cityIbgeCode = json['city_ibge_code'] ?? "";
    confirmed = json['confirmed'];
    confirmedPer_100kInhabitants = json['confirmed_per_100k_inhabitants'] ?? 0;
    date = json['date'];
    deathRate = json['death_rate'];
    deaths = json['deaths'];
    estimatedPopulation = json['estimated_population'] ?? 0;
    estimatedPopulation_2019 = json['estimated_population_2019'] ?? 0;
    isLast = json['is_last'];
    orderForPlace = json['order_for_place'];
    placeType = json['place_type'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city'] = city;
    _data['city_ibge_code'] = cityIbgeCode;
    _data['confirmed'] = confirmed;
    _data['confirmed_per_100k_inhabitants'] = confirmedPer_100kInhabitants;
    _data['date'] = date;
    _data['death_rate'] = deathRate;
    _data['deaths'] = deaths;
    _data['estimated_population'] = estimatedPopulation;
    _data['estimated_population_2019'] = estimatedPopulation_2019;
    _data['is_last'] = isLast;
    _data['order_for_place'] = orderForPlace;
    _data['place_type'] = placeType;
    _data['state'] = state;
    return _data;
  }
}
