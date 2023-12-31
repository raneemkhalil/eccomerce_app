part of 'location_cubit.dart';

sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationLoaded extends LocationState {
  final List<LocationModel> locations;
  LocationLoaded({required this.locations});
}

final class LocationError extends LocationState {
  final String message;
  LocationError({required this.message});
}

final class LocationSelected extends LocationState {
  final LocationModel location;
  final bool selected;
  LocationSelected({required this.location, this.selected = false});
}