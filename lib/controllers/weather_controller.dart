import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/constants.dart';
import 'package:project/models/weather_model.dart';

class FetchWeatherAPI {
  Future<Weather> processData(latitude, longitude) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&lang=fr&APPID=$apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return Weather.fromJson(body);
    } else {
      throw Exception('Error getting weather');
    }
  }

  Future<Weather> processDataCity(city) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&lang=fr&APPID=$apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return Weather.fromJson(body);
    } else {
      throw Exception('Error getting weather');
    }
  }
}

class WeatherCity extends GetxController {
  final RxBool _isLoading = true.obs;

  RxBool checkLoading() => _isLoading;

  final weather = Weather().obs;

  getWeather(cityname) {
    return FetchWeatherAPI().processDataCity(cityname).then((value) {
      weather.value = value;
      _isLoading.value = false;
    });
  }
}

class WeatherController extends GetxController {
  // various variable
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  // instance of them to be called
  RxBool checkLoading() => _isLoading;

  RxDouble getLatitude() => _latitude;

  RxDouble getLongitude() => _longitude;

  final weather = Weather().obs;

  Weather getWeather() {
    return weather.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // status of permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    // get location
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      // calling API
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weather.value = value;
        _isLoading.value = false;
      });
    });
  }
}
