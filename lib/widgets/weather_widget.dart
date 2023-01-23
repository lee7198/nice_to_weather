import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({
    super.key,
  });

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late Future<Position> position;

  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Position? lastPosition = await Geolocator.getLastKnownPosition();
    return currentPosition;
  }

  @override
  void initState() {
    super.initState();

    position = getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Nice To Weather!",
          style: TextStyle(
            fontFamily: "NanumSquareNeo",
            fontSize: 56,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        FutureBuilder(
            future: position,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("$snapshot");
              }
              return const Text("...");
            })
      ],
    );
  }
}
