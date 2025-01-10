part of 'shipment_bloc.dart';

@immutable
sealed class ShipmentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchShipments extends ShipmentEvent {}