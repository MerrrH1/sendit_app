import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:send_it/models/shipment_model.dart';

class ShipmentRepository {
  final Dio dio;

  ShipmentRepository({required this.dio});

  Future<List<ShipmentModel>> fetchShipments() async {
    try {
      final response = await dio.get('http://127.0.0.1:8000/api/shipment');
      List<ShipmentModel> shipments = (response.data as List)
          .map((json) => ShipmentModel.fromJson(json))
          .toList();
      return shipments;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
