part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState([List props = const []]) : super();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WeatherLoaded extends WeatherState {
  Weather weather;
  WeatherLoaded(this.weather) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}
