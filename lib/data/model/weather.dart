import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperature;
  const Weather(this.cityName, this.temperature) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}
