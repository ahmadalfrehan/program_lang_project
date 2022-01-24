// ignore_for_file: file_names

import 'package:abood/storage/const.dart';
import 'package:flutter/material.dart';

import 'Edit.dart';
import 'Product.dart';
// import 'package:programming_language/Edit.dart';
// import 'package:programming_language/Product.dart';

class HisProducts extends StatefulWidget {
  // var image;
  // HisProducts(this.image);
  @override
  _HisProductsState createState() => _HisProductsState();
}

class _HisProductsState extends State<HisProducts> {
  // var image;
  _HisProductsState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("My Products", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: coco,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: 10,
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      itemBuilder: (context, index) => newMethod(),
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

  Widget newMethod() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width * .6,
        height: 90,
        child: ListTile(
          title: Text("ahmad"),
          subtitle: Text("price"),
          trailing: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Product()));
              },
              icon: Icon(Icons.arrow_right, color: coco)),
          leading: Container(
            width: 100,
            height: 100,
            // child: Image.file(
            //   image,
            //   fit: BoxFit.contain,
            //   height: 100,
            //   width: 100,
            // ),
          ),
        ),
      ),
    );
  }
}
/**
 * Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(1, 1, 14, 10),
          height: 360,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(1, 1, 18, 10),
          height: 370,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Positioned(
          top: 0,
          left: 100,
          right: 100,
          child: Container(
            width: 110,
            height: 120,
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          bottom: 230,
          left: 30,
          child: Text("name of the product:"),
        ),
        const Positioned(
          bottom: 215,
          left: 30,
          child: Text("the price is :"),
        ),
        const Positioned(
          bottom: 200,
          left: 30,
          child: Text("date of end :"),
        ),
        const Positioned(
          bottom: 180,
          left: 30,
          child: Text("the number of products :"),
        ),
        const Positioned(
          bottom: 150,
          left: 30,
          child: Text("the facebook is :"),
        ),
        const Positioned(
          bottom: 120,
          left: 30,
          child: Text("the number of user :"),
        ),
            ],
          ),
        )
      ],
    );
 */