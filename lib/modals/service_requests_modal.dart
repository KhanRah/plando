// To parse this JSON data, do
//
//     final serviceRequests = serviceRequestsFromMap(jsonString);

import 'dart:convert';

List<ServiceRequests> serviceRequestsFromMap(String str) => List<ServiceRequests>.from(json.decode(str).map((x) => ServiceRequests.fromMap(x)));

String serviceRequestsToMap(List<ServiceRequests> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ServiceRequests {
  ServiceRequests({
    this.requestId,
    this.title,
    this.description,
    this.userId,
    this.userName,
    this.companyId,
    this.companyName,
    this.imageFile,
    this.pdfFile,
    this.createdAt,
    this.priority,
    this.status,
    this.assetId,
    this.assetName,
    this.udpatedAt,
    this.updatedAt,
  });

  int? requestId;
  String? title;
  String? description;
  int? userId;
  String? userName;
  int? companyId;
  String? companyName;
  String? imageFile;
  String? pdfFile;
  DateTime? createdAt;
  String? priority;
  String? status;
  int? assetId;
  String? assetName;
  DateTime? udpatedAt;
  DateTime? updatedAt;

  factory ServiceRequests.fromMap(Map<String, dynamic> json) => ServiceRequests(
    requestId: json["requestId"],
    title: json["title"],
    description: json["description"],
    userId: json["userId"],
    userName: json["userName"],
    companyId: json["companyId"],
    companyName: json["companyName"],
    imageFile: json["imageFile"],
    pdfFile: json["pdfFile"],
    createdAt: DateTime.parse(json["createdAt"]),
    priority: json["priority"],
    status: json["status"],
    assetId: json["assetId"],
    assetName: json["assetName"],
    udpatedAt: json["udpatedAt"] == null ? null : DateTime.parse(json["udpatedAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "requestId": requestId,
    "title": title,
    "description": description,
    "userId": userId,
    "userName": userName,
    "companyId": companyId,
    "companyName": companyName,
    "imageFile": imageFile,
    "pdfFile": pdfFile,
    "createdAt": createdAt!.toIso8601String(),
    "priority": priority,
    "status": status,
    "assetId": assetId,
    "assetName": assetName,
    "udpatedAt": udpatedAt == null ? null : udpatedAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
