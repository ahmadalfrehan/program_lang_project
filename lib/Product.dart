// ignore_for_file: file_names, prefer_const_constructors
import 'package:abood/Edit.dart';
import 'package:abood/screen&cubits/home_screen/home_screen.dart';
import 'package:abood/storage/const.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  // var image;
  Product();
  @override
  _ProductState createState() => _ProductState();
}

var image;

class _ProductState extends State<Product> {
  var Scaffoldkey = GlobalKey<ScaffoldState>();
  _ProductState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 30, 4, 20),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(1, 1, 18, 10),
                          height: 700,
                          decoration: BoxDecoration(
                            color: coco,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 70,
                          right: 70,
                          height: 200,
                          child: Container(
                            width: 100,
                            height: 270,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: image == null
                                ? Image.asset("build/assets/A.jpg")
                                : Image.file(
                                    image,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 420,
                          left: 3,
                          child: Row(
                            children: [
                              Icon(Icons.production_quantity_limits),
                              SizedBox(
                                width: 100,
                              ),
                              Text(isArabic
                                  ? "اسم المنتج"
                                  : "name of the product:"),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 380,
                          left: 3,
                          child: Row(
                            children: [
                              Icon(Icons.price_change),
                              SizedBox(
                                width: 100,
                              ),
                              Text(isArabic
                                  ? "السعر الحالي "
                                  : "current price :"),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 340,
                          left: 3,
                          child: Row(
                            children: [
                              Icon(Icons.price_change),
                              SizedBox(
                                width: 118,
                              ),
                              Text(isArabic ? "السعر" : "the price "),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 300,
                            left: 3,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                ),
                                SizedBox(
                                  width: 110,
                                ),
                                Text(isArabic
                                    ? "تاريخ الانتهاء "
                                    : "Date of end "),
                              ],
                            )),
                        Positioned(
                            bottom: 260,
                            left: 3,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.format_list_numbered,
                                ),
                                SizedBox(
                                  width: 110,
                                ),
                                Text(isArabic ? "الكمية المتوفرة " : "amount"),
                              ],
                            )),
                        Positioned(
                          bottom: 220,
                          left: 3,
                          child: Row(
                            children: [
                              Icon(
                                Icons.facebook,
                              ),
                              SizedBox(
                                width: 110,
                              ),
                              Text(isArabic
                                  ? " رابط الفيسبوك"
                                  : "the facebook url :"),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 180,
                          left: 3,
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                              ),
                              SizedBox(
                                width: 110,
                              ),
                              Text(isArabic
                                  ? "رقم الهاتف"
                                  : "the phone bumber :"),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 140,
                          left: 3,
                          child: Row(
                            children: [
                              Icon(
                                Icons.category,
                              ),
                              SizedBox(
                                width: 110,
                              ),
                              Text(isArabic ? "التصنيف" : "Category : "),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 100,
                          left: 3,
                          child: Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye,
                              ),
                              SizedBox(
                                width: 110,
                              ),
                              Text(isArabic ? "المشاهدات" : "seen :"),
                            ],
                          ),
                        ),
                        const Positioned(
                          bottom: 40,
                          left: 27,
                          child: Divider(
                            thickness: 12,
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 27,
                          child: MaterialButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.thumb_up_alt_outlined),
                                Text(isArabic ? "اعجبني" : ' Like'),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 150,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Edit()));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.edit),
                                Text(isArabic ? "تعديلل" : 'Edit'),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 250,
                          child: MaterialButton(
                            onPressed: () {
                              Scaffoldkey.currentState!
                                  .showBottomSheet(
                                    (context) => Scaffold(
                                      body: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              label: Text(isArabic
                                                  ? "اكتب تعليقك"
                                                  : "write your comment"),
                                              fillColor: Colors.white,
                                              filled: true,
                                              enabled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            keyboardType: TextInputType.text,
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return isArabic
                                                    ? "الحقل يحب الا يكون فارغا"
                                                    : 'the field must not be empty';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .closed;
                            },
                            child: Row(
                              children: [
                                Icon(Icons.messenger),
                                Text(isArabic ? "تعليق" : ' Comment'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
