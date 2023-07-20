import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/weather_controller.dart';
import 'package:project/views/weather/additional_weather.dart';
import 'package:project/views/weather/current_weather.dart';
import 'package:project/views/weather/header_widget.dart';

class SearchWeather extends StatefulWidget {
  const SearchWeather({super.key, required this.cityName});

  final String cityName;

  @override
  _SearchWeatherState createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  WeatherCity weatherController = Get.put(WeatherCity(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Weather"),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() {
              if (weatherController.checkLoading().isTrue) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/clouds.png",
                      height: 200,
                      width: 200,
                    ),
                    const CircularProgressIndicator()
                  ],
                ));
              } else {
                return SafeArea(
                    child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const HeaderWidget(),
                    const SizedBox(
                      height: 30,
                    ),
                    currentWeather(
                        "assets/weather/${weatherController.getWeather(widget.cityName).icon}.png",
                        weatherController
                            .getWeather(widget.cityName)
                            .temp
                            .toString(),
                        weatherController
                            .getWeather(widget.cityName)
                            .description
                            .toString()),
                    const SizedBox(
                      height: 30,
                    ),
                    additionalInformation(
                        weatherController
                            .getWeather(widget.cityName)
                            .humidity
                            .toString(),
                        weatherController
                            .getWeather(widget.cityName)
                            .wind
                            .toString(),
                        weatherController
                            .getWeather(widget.cityName)
                            .pressure
                            .toString()),
                  ],
                ));
              }
            })
          ],
        ),
      ),
    );
  }
}
