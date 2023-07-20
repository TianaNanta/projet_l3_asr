import 'package:flutter/material.dart';

Widget currentWeather(String asset, String temp, String description) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(asset),
          width: 100,
          height: 100,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "$temp °C",
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
