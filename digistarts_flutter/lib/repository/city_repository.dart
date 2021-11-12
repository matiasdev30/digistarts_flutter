import 'package:digistarts_flutter_test/model/city_model.dart';
import 'package:get/get.dart';

class CityRepository extends GetConnect {
  String url =
      "https://api.brasil.io/v1/dataset/covid19/caso/data/?search=&date=&state=&place_type=city&is_last=&city_ibge_code";

  // The request header
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Token 8b34c604f8c467c5950550f6870bde20dc5229fb'
  };

  // This function serves to request all cities
  Future<List<CityModel>> findAllCity() async {
    final response = await get(url, headers: headers);

    if(response.hasError){
      throw Exception('Erro ao buscar cidades');
    }
    
    List<dynamic> data = response.body["results"];
    return data.map((e) => CityModel.fromJson(e)).toList();
  }
}
