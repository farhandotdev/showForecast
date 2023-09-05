import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/weatherapikey.dart';
import 'forecast_card.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    String cityName = 'London';
    final result = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName,uk&APPID=$weatherAPIKey',
      ),
    );
    print(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print("refrese");
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: "Enter city name ...",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  color: const Color.fromARGB(255, 3, 43, 5),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              "310.80 °K",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Icon(
                              Icons.sunny,
                              color: Colors.yellow,
                              size: 64,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Sunny",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Weather Forecast",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_right_sharp,
                  size: 36,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ForecastCard(
                    time: "00:00",
                    icon: Icons.cloud,
                    value: "302.17",
                  ),
                  ForecastCard(
                    time: "04:00",
                    icon: Icons.cloud,
                    value: "303.70",
                  ),
                  ForecastCard(
                    time: "08:00",
                    icon: Icons.sunny,
                    value: "310:18",
                  ),
                  ForecastCard(
                    time: "12:00",
                    icon: Icons.sunny,
                    value: "329.90",
                  ),
                  ForecastCard(
                    time: "16:00",
                    icon: Icons.cloud,
                    value: "320.98",
                  ),
                  ForecastCard(
                    time: "20:00",
                    icon: Icons.cloud,
                    value: "311:21",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_right_outlined,
                  size: 36,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfo(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "94",
                ),
                AdditionalInfo(
                  icon: Icons.air,
                  label: "Wind Speed",
                  value: "9.3",
                ),
                AdditionalInfo(
                  icon: Icons.beach_access,
                  label: "Pressure",
                  value: "1100",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
