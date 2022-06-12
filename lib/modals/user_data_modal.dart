// To parse this JSON data, do
//
//     final userDataModal = userDataModalFromMap(jsonString);

import 'dart:convert';

UserDataModal userDataModalFromMap(String str) => UserDataModal.fromMap(json.decode(str));

String userDataModalToMap(UserDataModal data) => json.encode(data.toMap());

class UserDataModal {
  UserDataModal({
    this.userId,
    this.companyId,
    this.userName,
    this.companyName,
    this.clientId,
    this.clientName,
    this.locationId,
    this.roleName,
    this.isTechnician,
    this.token,
  });

  int? userId;
  int? companyId;
  String? userName;
  String? companyName;
  int? clientId;
  String? clientName;
  int? locationId;
  String? roleName;
  bool? isTechnician;
  String? token;

  factory UserDataModal.fromMap(Map<String, dynamic> json) => UserDataModal(
    userId: json["userId"],
    companyId: json["companyId"],
    userName: json["userName"],
    companyName: json["companyName"],
    clientId: json["clientId"],
    clientName: json["clientName"],
    locationId: json["locationId"],
    roleName: json["roleName"],
    isTechnician: json["isTechnician"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "companyId": companyId,
    "userName": userName,
    "companyName": companyName,
    "clientId": clientId,
    "clientName": clientName,
    "locationId": locationId,
    "roleName": roleName,
    "isTechnician": isTechnician,
    "token": token,
  };
}
