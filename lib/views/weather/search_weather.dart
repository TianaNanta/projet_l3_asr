import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/weather_controller.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/views/weather/additional_weather.dart';
import 'package:project/views/weather/current_weather.dart';
import 'package:project/views/weather/header_widget.dart';

class SearchWeather extends StatefulWidget {
  const SearchWeather({Key? key}) : super(key: key);

  @override
  _SearchWeatherState createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  WeatherCity weatherController = Get.put(WeatherCity(), permanent: true);
  final cityNameController = TextEditingController();

  Weather weather = Weather();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Weather"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: cityNameController,
              decoration: const InputDecoration(
                hintText: 'Enter city name',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Get the city name from the text field.
                String cityName = cityNameController.text;

                // Get the weather data for the city name.
                weather = weatherController.getWeather(cityName);
              },
              child: const Text('Get Weather'),
            ),
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
                        "assets/weather/${weather.icon}.png",
                        weather.temp.toString(),
                        weather.description.toString()),
                    const SizedBox(
                      height: 30,
                    ),
                    additionalInformation(weather.humidity.toString(),
                        weather.wind.toString(), weather.pressure.toString()),
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
