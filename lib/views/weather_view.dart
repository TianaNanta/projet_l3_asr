import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/weather_controller.dart';
import 'package:project/views/weather/additional_weather.dart';
import 'package:project/views/weather/current_weather.dart';
import 'package:project/views/weather/header_widget.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  WeatherController weatherController =
      Get.put(WeatherController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
        backgroundColor: Colors.teal.shade400,
        elevation: 0,
      ),
      body: SafeArea(
          child: Obx(() => weatherController.checkLoading().isTrue
              ? Center(
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
                ))
              : ListView(
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
                        "assets/weather/${weatherController.getWeather().icon}.png",
                        weatherController.getWeather().temp.toString(),
                        weatherController.getWeather().description.toString()),
                    const SizedBox(
                      height: 30,
                    ),
                    additionalInformation(
                        weatherController.getWeather().humidity.toString(),
                        weatherController.getWeather().wind.toString(),
                        weatherController.getWeather().pressure.toString()),
                  ],
                ))),
    );
  }
}
