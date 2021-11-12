import 'package:digistarts_flutter_test/constants.dart';
import 'package:digistarts_flutter_test/controller/home_controller.dart';
import 'package:digistarts_flutter_test/model/city_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _searchBar(),
            const Spacer(),
            _listGeneretCitys()
          ],
        ),
      ),
    );
  }

  _listGeneretCitys() {
    return SizedBox(
        width: Get.width,
        height: Get.height - 184,
        child: FutureBuilder(
            future: homeController.findCity(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Obx(() => homeController.foundCitys.isNotEmpty
                    ? ListView(
                        children: [
                          Center(
                            child: Wrap(
                                children: List.generate(
                                    homeController.foundCitys.length,
                                    (index) => myCard(
                                        homeController.foundCitys[index]))),
                          ),
                        ],
                      )
                    : const Center(child: Text('Resultados não encotrado')));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  _searchBar() {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: 120,
            width: Get.width,
            color: primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Cidades",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "Temos apresentado as cidades, com seus respetivos dados sobre a covid-19.",
                    style: TextStyle(fontSize: 12, color: Colors.white))
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xffFCFCFE),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 8,
                            )
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      width: 280,
                      height: 40,
                      child: TextFormField(
                        onChanged: (value) => homeController.runFilter(value),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pesquisar',
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  myCard(CityModel city) {
    return Stack(
      children: [
        Container(
          width: 240,
          height: 80,
          margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 5),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  city.city,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "População " + city.estimatedPopulation.toString(),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "Mortes " + city.deaths.toString(),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          child: Container(
            width: 80,
            height: 30,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                city.state,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
