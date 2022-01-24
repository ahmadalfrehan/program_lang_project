import 'package:abood/screen&cubits/login/shop_login_screen.dart';
import 'package:abood/screen&cubits/register/shop_register_screen.dart';
import 'package:abood/storage/const.dart';
import 'package:abood/storage/my_dio.dart';
import 'package:abood/temp_model.dart';
import 'package:flutter/material.dart';

void main() {
  MyDio.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: coco,
      ),
      home: StoreRegisterScreen(),
      // home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class Tempp extends StatelessWidget {
  late final TempModel t;

  Tempp(this.t);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Done mo3aleem he token ${t.token}'),
      ),
    );
  }
}

class Temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Done'),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//             widget.title,
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           )),
//       body: Add(),
//     );
//   }
// }
