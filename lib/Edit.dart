// ignore_for_file: file_names

import 'package:abood/screen&cubits/home_screen/home_screen.dart';
import 'package:abood/storage/const.dart';
import 'package:flutter/material.dart';
// import 'package:programming_language/Home.dart';


class Edit extends StatefulWidget {
  // var image;
  // Edit(this.image);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  var nameController = TextEditingController();
  var endController = TextEditingController();
  var CategoryController = TextEditingController();
  var phoneController = TextEditingController();
  var facebookController = TextEditingController();
  var QuntityController = TextEditingController();
  var priceController = TextEditingController();

  // var image;

  String? dropdown;
  _EditState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Edit",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 20, 4, 20),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(1, 1, 18, 1),
                            height: 260,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 6, 6, 10),
                            child: Container(
                              alignment: Alignment.center,
                              height: 250,
                              width: 150,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(300),
                                ),
                              ),
                              // child: Image.file(
                              //   image,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              newMethod("Name of product", true, nameController),
              newMethod("date of end", false, endController),
              newMethod("Phone number", true, phoneController),
              newMethod("Facenook Url", true, facebookController),
              newMethod(
                  "Quantity available from the product", true, priceController),
              newMethod("Price", true, QuntityController),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black54),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.black26,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    isDense: false,
                    dropdownColor: Colors.teal,
                    borderRadius: BorderRadius.circular(45),
                    hint: dropdown == null
                        ? const Text("  Select the category ")
                        : Text(
                            dropdown!,
                            style: const TextStyle(color: Colors.black),
                          ),
                    isExpanded: true,
                    iconSize: 30,
                    style: const TextStyle(color: Colors.white),
                    items: <String>[
                      'phones',
                      'computers',
                      'food',
                      'clothes',
                      'chaires',
                      'books',
                      'fruites',
                      'other'
                    ].map((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        dropdown = val!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 7,
                  shape: const StadiumBorder(
                      side: BorderSide(color: Colors.white)),
                  fixedSize: const Size(300, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                child: const Text(
                  "Save the changes?",
                  style: TextStyle(
                    color: coco,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding newMethod(String s, bool t, var Controoler) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(s),
          fillColor: Colors.white,
          filled: true,
          enabled: t,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        controller: Controoler,
        keyboardType: TextInputType.text,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'the field must not be empty';
          }
          return null;
        },
      ),
    );
  }
}
