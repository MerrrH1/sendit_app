class ShipmentModel {
  final int id;
  final String trackingNumber;
  final String sender;
  final String receiver;
  final String origin;
  final String destination;
  final String status;
  final int courier;
  final DateTime createdAt;
  final DateTime lastModified;
  final String? createdBy;
  final String? modifiedBy;

  ShipmentModel(
      {required this.id,
      required this.trackingNumber,
      required this.sender,
      required this.receiver,
      required this.origin,
      required this.destination,
      required this.status,
      required this.courier,
      required this.createdAt,
      required this.lastModified,
      required this.createdBy,
      required this.modifiedBy});

  factory ShipmentModel.fromJson(Map<String, dynamic> json) {
    return ShipmentModel(
        id: json['id'],
        trackingNumber: json['trackingNumber'],
        sender: json['sender'],
        receiver: json['receiver'],
        origin: json['origin'],
        destination: json['destination'],
        status: json['status'],
        courier: json['courier'],
        createdAt: DateTime.parse(json['createdAt']),
        lastModified: DateTime.parse(json['lastModified']),
        createdBy: json['createdBy'],
        modifiedBy: json['modifiedBy']);
  }
}
