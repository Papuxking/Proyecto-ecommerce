// src/domain/models/User.dart
import 'package:ecommerce_flutter/src/domain/models/Role.dart';

class User {
    int? id;
    String name;
    String lastname;
    String email;
    String phone;  
    String? image;
    String? password;
    String? notificationToken;  
    List<Role>? roles;

    User({
        this.id,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        this.password,
        this.image,
        this.notificationToken = 'default_token', // Asignar token predeterminado,
        this.roles,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"]?? 0,
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"]?? '',
        image: json["image"] ?? '',
        notificationToken: json["notification_token"]?? 'default_token',
        roles: json["roles"] != null ? List<Role>.from(json["roles"].map((x) => Role.fromJson(x))):[],
    );


    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "image": image,
        "password": password,
        "notification_token": notificationToken ?? 'default_token',
        "roles": roles != null ? List<dynamic>.from(roles!.map((x) => x.toJson())): [],
    };
}