// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String owner;
    String itemName;
    String category;
    int amount;
    int price;
    String description;
    DateTime dateAdded;

    Fields({
        required this.user,
        required this.owner,
        required this.itemName,
        required this.category,
        required this.amount,
        required this.price,
        required this.description,
        required this.dateAdded,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        owner: json["owner"],
        itemName: json["item_name"],
        category: json["category"],
        amount: json["amount"],
        price: json["price"],
        description: json["description"],
        dateAdded: DateTime.parse(json["date_added"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "owner": owner,
        "item_name": itemName,
        "category": category,
        "amount": amount,
        "price": price,
        "description": description,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    };
}
