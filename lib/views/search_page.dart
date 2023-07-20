import 'package:flutter/material.dart';
import 'package:project/views/weather/search_weather.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Page")),
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
                // Navigate to the search weather page. Pass the city name as a parameter.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchWeather(cityName: cityName),
                  ),
                );
              },
              child: const Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
