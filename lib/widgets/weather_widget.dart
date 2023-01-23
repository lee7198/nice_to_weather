import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});
  void initState() {
    initState();

    getPosition();
  }

  Future<void> getPosition() async {
    var currentPosition = await Geolocator.getCurrentPosition();
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(currentPosition);
    print(lastPosition);
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Nice To Weather!",
        style: TextStyle(
          fontFamily: "NanumSquareNeo",
          fontSize: 56,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
      ),
    );
  }
}
