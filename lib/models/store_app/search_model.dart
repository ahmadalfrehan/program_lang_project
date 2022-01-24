import 'dart:convert';

class SearchModel {
  late bool status;
  late Null message;
  late Product data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = new Product.fromJson(json['data']);
  }
}
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);


Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
     required   this.name,
     required   this.userId,
     required   this.imgUrl,
     required   this.exDate,
     required   this.categoryId,
     required   this.orgPrice,
     required   this.amount,
     required   this.viewNum,
     required   this.currentPrice,
    });

    String name;
    String userId;
    String imgUrl;
    String exDate;
    String categoryId;
    String orgPrice;
    String amount;
    String viewNum;
    String currentPrice;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        userId: json["user_id"],
        imgUrl: json["img_url"],
        exDate: json["ex_date"],
        categoryId: json["category_id"],
        orgPrice: json["org_price"],
        amount: json["amount"],
        viewNum: json["view_num"],
        currentPrice: json["current_price"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "user_id": userId,
        "img_url": imgUrl,
        "ex_date": exDate,
        "category_id": categoryId,
        "org_price": orgPrice,
        "amount": amount,
        "view_num": viewNum,
        "current_price": currentPrice,
    };
}
