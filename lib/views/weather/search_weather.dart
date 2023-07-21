import 'package:flutter/material.dart';
import 'package:project/controllers/weather_controller.dart';
import 'package:project/models/weather_model.dart';
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
  FetchWeatherAPI client = FetchWeatherAPI();
  Weather? weather;

  Future<void> getWeather() async {
    weather = await client.processDataCity(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Weather"),
      ),
      body: FutureBuilder(
        future: getWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                currentWeather("assets/weather/${weather?.icon}.png",
                    weather!.temp.toString(), weather!.description.toString()),
                const SizedBox(
                  height: 30,
                ),
                additionalInformation(weather?.humidity.toString(),
                    weather?.wind.toString(), weather?.pressure.toString()),
              ],
            ));
          } else {
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
          }
        },
      ),
    );
  }
}
