import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_it/bloc/shipment_bloc.dart';
import 'package:send_it/repository/shipment_repository.dart';
import 'package:send_it/models/shipment_model.dart';
import 'package:dio/dio.dart';

class ShipmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShipmentBloc(ShipmentRepository(dio: Dio()))..add(FetchShipments()),
      child: Scaffold(
        appBar: AppBar(title: Text('Shipments')),
        body: BlocBuilder<ShipmentBloc, ShipmentState>(
          builder: (context, state) {
            if (state is ShipmentLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ShipmentLoaded) {
              return ListView.builder(
                itemCount: state.shipments.length,
                itemBuilder: (context, index) {
                  final shipment = state.shipments[index];
                  return ListTile(
                    title: Text(shipment.trackingNumber),
                    subtitle: Text('Sender: ${shipment.sender}, Receiver: ${shipment.receiver}'),
                  );
                },
              );
            } else if (state is ShipmentError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}