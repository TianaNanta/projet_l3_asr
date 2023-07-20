class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;
  double? feelsLike;
  String? description;
  String? main;
  String? icon;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.pressure,
    this.feelsLike,
    this.description,
    this.main,
    this.icon,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    feelsLike = json["main"]["feels_like"];
    description = json["weather"][0]["description"];
    main = json["weather"][0]["main"];
    icon = json["weather"][0]["icon"];
  }
}
