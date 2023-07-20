import 'package:flutter/material.dart';

Widget additionalInformation(
    String? humidity, String? windSpeed, String? pressure) {
  const double icon = 40;
  const double size = 15.0;
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15.0,
        ),
        const Text(
          "Additional Information",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/icons/humidity.png"),
                  width: icon,
                  height: icon,
                ),
                const Text(
                  "Humidity",
                  style: TextStyle(
                    fontSize: size,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "$humidity %",
                  style: const TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/icons/windspeed.png"),
                  width: icon,
                  height: icon,
                ),
                const Text(
                  "Wind Speed",
                  style: TextStyle(
                    fontSize: size,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "$windSpeed m/s",
                  style: const TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/icons/pressure.png"),
                  width: icon,
                  height: icon,
                ),
                const Text(
                  "Pressure",
                  style: TextStyle(
                    fontSize: size,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "$pressure hPa",
                  style: const TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
