import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:send_it/models/shipment_model.dart';
import 'package:send_it/repository/shipment_repository.dart';

part 'shipment_event.dart';
part 'shipment_state.dart';

class ShipmentBloc extends Bloc<ShipmentEvent, ShipmentState> {
  final ShipmentRepository shipmentRepository;
  ShipmentBloc(this.shipmentRepository) : super(ShipmentInitial()) {
    on<FetchShipments>((event, emit) async {
      emit(ShipmentLoading());
      try {
        final shipments = await shipmentRepository.fetchShipments();
        emit(ShipmentLoaded(shipments: shipments));
      } catch (e) {
        emit(ShipmentError(message: e.toString()));
      }
    });
  }
}
