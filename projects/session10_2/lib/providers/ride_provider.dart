import 'package:flutter/material.dart';
import 'package:gojek_clone/models/ride_option.dart';
import 'package:gojek_clone/services/mock_service.dart';

class RideProvider with ChangeNotifier {
  final _svc = MockService();
  List<RideOption> options = [];
  RideOption? selected;
  
  Future<void> loadOptions() async {
    options = await _svc.fetchRideOptions();
    notifyListeners();
  }

  void selectOption(RideOption opt) {
    selected = opt;
    notifyListeners();
  }
}
