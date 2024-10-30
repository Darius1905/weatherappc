import 'dart:async';

import 'package:weatherapp/data/model/weatherModel.dart';
import 'package:weatherapp/data/repository/weatherRepository.dart';

class WeatherAppViewModel{
  StreamController<List<WeatherDataModel>> weatherSteam = StreamController();

  void loadWeather(){
    final repository = DefaultRepository();
    repository.loadData().then((value)=> weatherSteam.add(value!));}
}