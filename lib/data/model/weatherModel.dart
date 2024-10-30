class WeatherDataModel {
  Coord coord;
  List<Weather> weather;
  Main main;
  Wind wind;
  Clouds clouds;
  Sys sys;
  int visibility;
  int dt;
  int timezone;
  int id;
  String name;
  int cod;

  WeatherDataModel(
      {required this.coord,
      required this.weather,
      required this.main,
      required this.wind,
      required this.clouds,
      required this.sys,
      required this.visibility,
      required this.dt,
      required this.timezone,
      required this.id,
      required this.name,
      required this.cod});

  factory WeatherDataModel.formJson(Map<String, dynamic> json) {
    return WeatherDataModel(
        coord: Coord.fromJson(json['coord']),
        weather: (json['weather'] as List).map((item)=> Weather.fromJson(item)).toList(),
        main: Main.fromJson(json['main']),
        wind: Wind.fromJson(json['wind']),
        clouds: Clouds.fromJson(json['clouds']),
        sys: Sys.fromJson(json['sys']),
        visibility: json['visibility'],
        dt: json['dt'],
        timezone: json['timezone'],
        id: json['id'],
        name: json['name'],
        cod: json['cod']);
  }

  Map<String, dynamic> toJson() {
    return {
      'coord': coord,
      'weather': weather,
      'main': main,
      'wind': wind,
      'clouds': clouds,
      'sys': sys,
      'visibility': visibility,
      'dt': dt,
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  @override
  String toString() {
    return 'WeatherDataModel{coord: $coord, weather: $weather, main: $main, wind: $wind, clouds: $clouds, sys: $sys, visibility: $visibility, dt: $dt, timezone: $timezone, id: $id, name: $name, cod: $cod}';
  }
}

class Coord {
  final double lon;
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(lon: json['lon'], lat: json['lat']);
  }

  Map<String, dynamic> toJson() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  @override
  String toString() {
    return 'Coord{lon: $lon, lat: $lat}';
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  @override
  String toString() {
    return 'Weather{id: $id, main: $main, description: $description, icon: $icon}';
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  Main(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: json['temp'],
        feelsLike: json['feels_like'],
        tempMin: json['temp_min'],
        tempMax: json['temp_max'],
        pressure: json['pressure'],
        humidity: json['humidity']);
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  @override
  String toString() {
    return 'Main{temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity}';
  }
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed'], deg: json['deg'], gust: json['gust']);
  }

  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  @override
  String toString() {
    return 'Wind{speed: $speed, deg: $deg, gust: $gust}';
  }
}

class Clouds {
  int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all']);
  }

  Map<String, dynamic> toJson() {
    return {'all': all};
  }

  @override
  String toString() {
    return 'Clouds{all: $all}';
  }
}

class Sys {
  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  Sys(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
        type: json['type'],
        id: json['id'],
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset']);
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  @override
  String toString() {
    return 'Sys{type: $type, id: $id, country: $country, sunrise: $sunrise, sunset: $sunset}';
  }
}
