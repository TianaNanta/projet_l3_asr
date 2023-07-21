import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/controllers/weather_controller.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/views/weather/additional_weather.dart';
import 'package:project/views/weather/current_weather.dart';

class SearchWeather extends StatefulWidget {
  const SearchWeather({super.key, required this.cityName});

  final String cityName;

  @override
  _SearchWeatherState createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  String date = DateFormat('yMMMMd').format(DateTime.now());
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
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.cityName,
                        style: const TextStyle(
                          fontSize: 30,
                          height: 2,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        date,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                currentWeather("assets/weather/${weather!.icon}.png",
                    weather!.temp.toString(), weather!.description.toString()),
                const SizedBox(
                  height: 30,
                ),
                additionalInformation(weather!.humidity.toString(),
                    weather!.wind.toString(), weather!.pressure.toString()),
              ],
            );
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
