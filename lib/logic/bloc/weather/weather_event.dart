part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent([List props = const []]) : super();
}

class GetWeather extends WeatherEvent {
  final String cityName;
  GetWeather(this.cityName) : super([cityName]);

  @override
  List<Object?> get props => throw UnimplementedError();
}
