import 'package:abood/models/store_app/home_model.dart';
import 'package:abood/screen&cubits/register/cubit/cubit.dart';
import 'package:abood/screen&cubits/register/cubit/states.dart';
import 'package:abood/screen&cubits/register/shop_register_screen.dart';
import 'package:abood/storage/my_dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Add.dart';
import '../../HisProducts.dart';
import '../../Product.dart';
import '../../main.dart';
import '../../storage/const.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

String? dropdown;

class Home extends StatefulWidget {
  var image;
  Home({this.image});

  @override
  _HomeState createState() => _HomeState();
}

bool isArabic = false;
int i = 0;
int Selected = 0;
List Catergo = [
  "All",
  "food",
  "clothes",
  "cooking",
  "fruit",
  "chaires",
];

class _HomeState extends State<Home> {
  // var image;

  List<ProductModel> products = [];
  _HomeState();
  ReturnOptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isArabic = prefs.getBool('options')!;
      String s = isArabic.toString();
      print(s);
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    ReturnOptions();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => HomeScreenCubit(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {
          if (state is HomeScreenSuccessState) {
            print("Fuck OFFFFF");
            print(state.homeModel.data.toString());

            products = state.homeModel.data.products;
            //here to save token
            //check
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Temp(),
              ),
              (route) {
                return false;
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            floatingActionButton:
                FloatingActionButton(onPressed: () {}, child: Text('Sort')),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                !isArabic ? "Home Page" : "الصفحة الرئيسية",
                style: TextStyle(color: Colors.white),
              ),
            ),
            drawer: Drawer(
              elevation: 5,
              child: Container(
                child: ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(color: coco),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .07,
                          right: MediaQuery.of(context).size.width * .5,
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: (size.width * 0.03),
                                    left: (size.width * 0.0),
                                  ),
                                  // child: ClipOval(
                                  //   child: Image.file(
                                  //     image,
                                  //     fit: BoxFit.cover,
                                  //     height: 50,
                                  //     width: 50,
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                            Text(
                              isArabic ? "اسم المستخدم" : "user name",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            // Text("the tool that a user register with"),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HisProducts(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(isArabic
                                  ? "مشاهدة منتجاتي "
                                  : "view my products"),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Add(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(isArabic ? "اضافة منتج" : "Add Product "),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0,
                        ),
                        MaterialButton(
                          onPressed: () async {
                            isArabic == true
                                ? isArabic = false
                                : isArabic = true;
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool('options', isArabic);
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              Text(isArabic
                                  ? "تغيير اللغة ؟"
                                  : "change language?"),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 0,
                        ),
                        MaterialButton(
                          onPressed: () {
                            var e = AlertDialog(
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              content: SizedBox(
                                height: 120,
                                width: 150,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(isArabic
                                          ? "هل انت متاكد من انك تريد تسجيل الخروج ؟"
                                          : "Are you sure you want to log out ?\n"),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  StoreRegisterScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          isArabic
                                              ? "? تسجيل الخروج"
                                              : "log out",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            showDialog(
                                context: context, builder: (context) => e);
                          },
                          child: Row(
                            children: [
                              Text(isArabic ? "تسجيل الخروج؟" : "Log out"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              color: coco,
              child: Column(
                children: [
                  Container(
                    height: 70,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                    // margin: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffix: DropdownButton(
                          dropdownColor: Colors.white,
                          //  borderRadius: BorderRadius.circular(45),
                          hint: dropdown == null
                              ? Text(isArabic ? "حسب الاسم" : "by name")
                              : Text(
                                  dropdown!,
                                  style: const TextStyle(color: Colors.black),
                                ),
                          style: const TextStyle(color: Colors.black),
                          items: <String>[
                            isArabic ? "الاسم" : 'name',
                            isArabic ? "التاريخ" : 'date',
                            isArabic ? "الصنف" : 'catigory',
                          ].map((String val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              print(dropdown);
                              dropdown = val!;
                            });
                          },
                        ),
                        prefixIcon: Icon(Icons.search),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return isArabic
                              ? "! الحقل يجب الا يكون فارغ "
                              : "the field must not be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Catergo.length,
                      itemBuilder: (context, index) => buildGe(index, context),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                            itemCount: 12,
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
        },
      ),
    );
  }

  Widget buildGe(index, context) => GestureDetector(
        onTap: () {
          setState(() {
            Selected = index;
          });
          HomeScreenCubit.get(context).getHome('category', Catergo[index]);
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 15),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: index == Selected
                ? Colors.white.withOpacity(0.5)
                : Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            Catergo[index],
            style: TextStyle(
              color: index == Selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      );

  Widget newMethod({ProductModel? pro}) {
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
          title: Text(isArabic ? "اسم المنتج " : "ahmad"),
          subtitle: Text(isArabic ? "السعر " : "price"),
          trailing: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Product()));
              },
              icon: Icon(Icons.arrow_right, color: coco)),
          leading: Container(
            width: 100,
            height: 100,
            child: image == null
                ? Image.asset("build/assets/A.jpg")
                : Image.file(
                    image,
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                  ),
          ),
        ),
      ),
    );
  }
}
