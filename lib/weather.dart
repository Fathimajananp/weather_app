import 'package:flutter/material.dart';
import 'package:weather_app/api_service.dart';
import 'package:weather_app/modal_class/weather_modal_class.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Createuser> WeatherData;

  @override
  void initState() {
    super.initState();
    WeatherData = fetchweatherdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        title: Text(
          "Weather App",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<Createuser>(
        future: WeatherData,
        builder: (context, snapshot) {
          // By default, show a loading spinner.

          // ── 1. Loading ─────────────────────────────
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ── 2. Error ───────────────────────────────
          if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }

          // ── 3. No data ─────────────────────────────

          if (!snapshot.hasData) {
            return Center(child: Text('No Data'));
          }

          // ── 4. Data ────────────────────────────────
          final data = snapshot.data!;
          final day = data.forecastDaily.days[0];

          return Padding(
            padding: const EdgeInsetsGeometry.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Temperature",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text("${day.temperatureMax.toStringAsFixed(1)}°",style: TextStyle(fontSize: 40,color: Colors.white),),

                  SizedBox(height: 20,),

                  Text(
                    "Minimum: ${day.temperatureMin.toStringAsFixed(0)}°",style: TextStyle(fontSize: 30,color: Colors.white),
                  ),
                  Text(
                    "Humidity: ${(day.daytimeForecast.humidity*100).toStringAsFixed(0)}%",style: TextStyle(fontSize: 30,color: Colors.white),
                  ),
                  Text(
                    "Cloud Cover: ${(day.daytimeForecast.cloudCover*100).toStringAsFixed(0)}%",style: TextStyle(fontSize: 30,color: Colors.white),
                  ),
                  Text(
                    "Rain Chance: "
                        "${(day.daytimeForecast.precipitationChance * 100).toStringAsFixed(0)}%",style: TextStyle(fontSize: 30,color: Colors.white),
                  ),

                  Text(
                    "Rain Amount: "
                        "${day.daytimeForecast.precipitationAmount} mm",style: TextStyle(fontSize: 30,color: Colors.white),
                  ),

                  Text(
                    "Wind Speed: "
                        "${day.daytimeForecast.windSpeed}",style: TextStyle(fontSize: 30,color: Colors.white),
                  ),

                  Text(
                    "Condition: "
                        "${day.daytimeForecast.conditionCode.name}",style: TextStyle(fontSize: 30,color: Colors.white),
                  ),
                ],
              ),
            ),
          );

          // final temperatureMax = day.temperatureMax;
          // final temperatureMin = day.temperatureMin;
          //
          // final humidity = day.daytimeForecast.humidity;
          // final cloudCover = day.daytimeForecast.cloudCover;
          //
          // final rainChance = day.daytimeForecast.precipitationChance;
          // final rainAmount = day.daytimeForecast.precipitationAmount;
          //
          // final condition = day.daytimeForecast.conditionCode;
          //
          // return Column(
          //   children: [
          //     Text("Max : $temperatureMax°C"),
          //     Text("Min : $temperatureMin°C"),
          //     Text("Humidity : $humidity%"),
          //     Text("Cloud : $cloudCover%"),
          //     Text("Rain chance : $rainChance%"),
          //     Text("Rain amount : $rainAmount mm"),
          //     Text("Condition : ${condition.name}"),
          //   ],
          // );
        },
      ),
    );
  }
}
