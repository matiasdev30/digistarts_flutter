import 'package:digistarts_flutter_test/model/city_model.dart';
import 'package:digistarts_flutter_test/repository/city_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  CityRepository cityRepository = CityRepository();
  List<CityModel> citys = [];
  // This list holds the data for the list view
  var foundCitys = <CityModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    findCity();
  }

  // This function is called whenever the text field changes
  void runFilter(String enteredKeyword) {
    List<CityModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all citys 
      results = citys;
    } else {
      results = citys
          .where((city) =>
              city.city.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    foundCitys.value = results;
  }

  // This function to get all citys
  Future<List<CityModel>?> findCity() async {
    try {
      citys = await cityRepository.findAllCity();
      foundCitys.value = citys;
      return foundCitys;
    } catch (e) {
      print(e);
    }
  }
}
