import 'dart:convert';

Createuser createuserFromJson(String str) =>
    Createuser.fromJson(json.decode(str));

String createuserToJson(Createuser data) =>
    json.encode(data.toJson());

class Createuser {
  final String resource;
  final Parameters parameters;
  final ForecastDaily forecastDaily;

  Createuser({
    required this.resource,
    required this.parameters,
    required this.forecastDaily,
  });

  factory Createuser.fromJson(Map<String, dynamic> json) => Createuser(
    resource: json["resource"],
    parameters: Parameters.fromJson(json["parameters"]),
    forecastDaily: ForecastDaily.fromJson(json["forecastDaily"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "parameters": parameters.toJson(),
    "forecastDaily": forecastDaily.toJson(),
  };
}

class ForecastDaily {
  final DateTime reportedTime;
  final DateTime readTime;
  final List<Day> days;

  ForecastDaily({
    required this.reportedTime,
    required this.readTime,
    required this.days,
  });

  factory ForecastDaily.fromJson(Map<String, dynamic> json) =>
      ForecastDaily(
        reportedTime: DateTime.parse(json["reportedTime"]),
        readTime: DateTime.parse(json["readTime"]),
        days: List<Day>.from(
          json["days"].map((x) => Day.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "reportedTime": reportedTime.toIso8601String(),
    "readTime": readTime.toIso8601String(),
    "days": List<dynamic>.from(
      days.map((x) => x.toJson()),
    ),
  };
}

class Day {
  final DateTime forecastStart;
  final DateTime forecastEnd;
  final ConditionCode conditionCode;
  final int maxUvIndex;
  final double temperatureMax;
  final double temperatureMin;
  final double precipitationChance;
  final PrecipitationType precipitationType;
  final double precipitationAmount;
  final double snowfallAmount;
  final Forecast daytimeForecast;
  final Forecast overnightForecast;

  Day({
    required this.forecastStart,
    required this.forecastEnd,
    required this.conditionCode,
    required this.maxUvIndex,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.precipitationChance,
    required this.precipitationType,
    required this.precipitationAmount,
    required this.snowfallAmount,
    required this.daytimeForecast,
    required this.overnightForecast,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    forecastStart: DateTime.parse(json["forecastStart"]),
    forecastEnd: DateTime.parse(json["forecastEnd"]),

    conditionCode:
    conditionCodeValues.map[json["conditionCode"]]!,

    maxUvIndex: json["maxUvIndex"],

    temperatureMax:
    (json["temperatureMax"] ?? 0).toDouble(),

    temperatureMin:
    (json["temperatureMin"] ?? 0).toDouble(),

    precipitationChance:
    (json["precipitationChance"] ?? 0).toDouble(),

    precipitationType:
    precipitationTypeValues.map[
    json["precipitationType"]
    ]!,

    precipitationAmount:
    (json["precipitationAmount"] ?? 0).toDouble(),

    snowfallAmount:
    (json["snowfallAmount"] ?? 0).toDouble(),

    daytimeForecast:
    Forecast.fromJson(json["daytimeForecast"]),

    overnightForecast:
    Forecast.fromJson(json["overnightForecast"]),
  );

  Map<String, dynamic> toJson() => {
    "forecastStart": forecastStart.toIso8601String(),
    "forecastEnd": forecastEnd.toIso8601String(),
    "conditionCode":
    conditionCodeValues.reverse[conditionCode],
    "maxUvIndex": maxUvIndex,
    "temperatureMax": temperatureMax,
    "temperatureMin": temperatureMin,
    "precipitationChance": precipitationChance,
    "precipitationType":
    precipitationTypeValues.reverse[precipitationType],
    "precipitationAmount": precipitationAmount,
    "snowfallAmount": snowfallAmount,
    "daytimeForecast": daytimeForecast.toJson(),
    "overnightForecast": overnightForecast.toJson(),
  };
}

enum ConditionCode {
  DRIZZLE,
  RAIN,
  PARTLY_CLOUDY,
  MOSTLY_CLOUDY,
  MOSTLY_CLEAR,
}

final conditionCodeValues = EnumValues({
  "Drizzle": ConditionCode.DRIZZLE,
  "Rain": ConditionCode.RAIN,
  "PartlyCloudy": ConditionCode.PARTLY_CLOUDY,
  "MostlyCloudy": ConditionCode.MOSTLY_CLOUDY,
  "MostlyClear": ConditionCode.MOSTLY_CLEAR,
});

class Forecast {
  final DateTime forecastStart;
  final DateTime forecastEnd;
  final double cloudCover;
  final ConditionCode conditionCode;
  final double humidity;
  final double precipitationChance;
  final PrecipitationType precipitationType;
  final double precipitationAmount;
  final double snowfallAmount;
  final int windDirection;
  final double windSpeed;

  Forecast({
    required this.forecastStart,
    required this.forecastEnd,
    required this.cloudCover,
    required this.conditionCode,
    required this.humidity,
    required this.precipitationChance,
    required this.precipitationType,
    required this.precipitationAmount,
    required this.snowfallAmount,
    required this.windDirection,
    required this.windSpeed,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      Forecast(
        forecastStart:
        DateTime.parse(json["forecastStart"]),

        forecastEnd:
        DateTime.parse(json["forecastEnd"]),

        cloudCover:
        (json["cloudCover"] ?? 0).toDouble(),

        conditionCode:
        conditionCodeValues.map[json["conditionCode"]]!,

        humidity:
        (json["humidity"] ?? 0).toDouble(),

        precipitationChance:
        (json["precipitationChance"] ?? 0).toDouble(),

        precipitationType:
        precipitationTypeValues.map[
        json["precipitationType"]
        ]!,

        precipitationAmount:
        (json["precipitationAmount"] ?? 0).toDouble(),

        snowfallAmount:
        (json["snowfallAmount"] ?? 0).toDouble(),

        windDirection:
        json["windDirection"] ?? 0,

        windSpeed:
        (json["windSpeed"] ?? 0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "forecastStart":
    forecastStart.toIso8601String(),

    "forecastEnd":
    forecastEnd.toIso8601String(),

    "cloudCover": cloudCover,

    "conditionCode":
    conditionCodeValues.reverse[conditionCode],

    "humidity": humidity,

    "precipitationChance":
    precipitationChance,

    "precipitationType":
    precipitationTypeValues.reverse[precipitationType],

    "precipitationAmount":
    precipitationAmount,

    "snowfallAmount":
    snowfallAmount,

    "windDirection": windDirection,

    "windSpeed": windSpeed,
  };
}

enum PrecipitationType {
  RAIN,
  CLEAR,
}

final precipitationTypeValues = EnumValues({
  "rain": PrecipitationType.RAIN,
  "clear": PrecipitationType.CLEAR,
});

class Parameters {
  final String latitude;
  final String longitude;

  Parameters({
    required this.latitude,
    required this.longitude,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      Parameters(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map(
          (k, v) => MapEntry(v, k),
    );

    return reverseMap;
  }
}