import 'dart:convert';

List<CustomersModel> customersModelFromJson(String str) =>
    List<CustomersModel>.from(
        json.decode(str).map((x) => CustomersModel.fromJson(x)));

String customersModelToJson(List<CustomersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomersModel {
  CustomersModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobilePhone,
    this.landline,
    this.backupPhone,
    this.dob,
    this.maritalStatus,
    this.gender,
    this.occupation,
    this.notificationPreference,
    this.notificationLanguage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobilePhone;
  String? landline;
  String? backupPhone;
  String? dob;
  bool? maritalStatus;
  String? gender;
  String? occupation;
  String? notificationPreference;
  String? notificationLanguage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory CustomersModel.fromJson(Map<String, dynamic> json) => CustomersModel(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        mobilePhone: json["mobile_phone"],
        landline: json["landline"],
        backupPhone: json["backup_phone"],
        dob: json["dob"],
        maritalStatus: json["marital_status"],
        gender: json["gender"],
        occupation: json["occupation"],
        notificationPreference: json["notification_preference"],
        notificationLanguage: json["notification_language"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile_phone": mobilePhone,
        "landline": landline,
        "backup_phone": backupPhone,
        "dob": dob,
        "marital_status": maritalStatus,
        "gender": gender,
        "occupation": occupation,
        "notification_preference": notificationPreference,
        "notification_language": notificationLanguage,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
