import 'dart:async';
import 'package:gojek_clone/models/ride_option.dart';
import 'package:gojek_clone/models/driver.dart';

class MockService {
  Future<List<RideOption>> fetchRideOptions() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      RideOption(id: 'car', title: 'Car', price: 12.0, iconPath: 'assets/icons/car.svg'),
      RideOption(id: 'bike', title: 'Bike', price: 5.0, iconPath: 'assets/icons/bike.svg'),
    ];
  }

  Stream<Driver> trackDriverLocation(String driverId) async* {
    // emit a few dummy locations over time
    final path = [
      {'lat': -6.200, 'lng': 106.816},
      {'lat': -6.201, 'lng': 106.817},
      {'lat': -6.202, 'lng': 106.818},
    ];
    for (var point in path) {
      await Future.delayed(Duration(seconds: 2));
      yield Driver(
        id: driverId,
        name: 'Driver Joe',
        latitude: point['lat']!,
        longitude: point['lng']!,
      );
    }
  }
}
