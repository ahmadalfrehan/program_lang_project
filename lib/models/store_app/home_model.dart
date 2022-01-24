import 'dart:convert';

class HomeModel
{
  late String mess;
  late HomeDataModel data;

  HomeModel.fromJson(Map<String, dynamic> json)
  {
    mess= json['message'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel
{
  // List<BannerModel> banners = [];
  List<ProductModel> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json)
  {
    // json['banners'].forEach((element)
    // {
    //   banners.add(BannerModel.fromJson(element));
    // });

    json['products'].forEach((element)
    {
      products.add(ProductModel.fromJson(element));
    });
  }
}


ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
  required  this.categoryName,
  required  this.name,
  required  this.imgUrl,
  required  this.amount,
  required  this.exDate,
  required  this.orgPrice,
  required  this.listDiscounts,
  });

  String categoryName;
  String name;
  String imgUrl;
  int amount;
  String exDate;
  int orgPrice;
  List<ListDiscount> listDiscounts;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    categoryName: json["category_name"],
    name: json["name"],
    imgUrl: json["img_url"],
    amount: json["amount"],
    exDate: json["ex_date"],
    orgPrice: json["org_price"],
    listDiscounts: List<ListDiscount>.from(json["list_discounts"].map((x) => ListDiscount.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "name": name,
    "img_url": imgUrl,
    "amount": amount,
    "ex_date": exDate,
    "org_price": orgPrice,
    "list_discounts": List<dynamic>.from(listDiscounts.map((x) => x.toJson())),
  };
}

class ListDiscount {
  ListDiscount({
  required  this.discountPercentage,
  required  this.date,
  });

  int discountPercentage;
  DateTime date;

  factory ListDiscount.fromJson(Map<String, dynamic> json) => ListDiscount(
    discountPercentage: json["discount_percentage"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "discount_percentage": discountPercentage,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };
}
