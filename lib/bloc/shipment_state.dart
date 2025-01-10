part of 'shipment_bloc.dart';

@immutable
sealed class ShipmentState {
  @override
  List<Object> get props => [];
}

final class ShipmentInitial extends ShipmentState {}

final class ShipmentLoading extends ShipmentState {}

final class ShipmentLoaded extends ShipmentState {
  final List<ShipmentModel> shipments;

  ShipmentLoaded({required this.shipments});

  @override
  List<Object> get props => [shipments];
}

final class ShipmentError extends ShipmentState {
  final String message;

  ShipmentError({required this.message});

  @override
  List<Object> get props => [message];
}