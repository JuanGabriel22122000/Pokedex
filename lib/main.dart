import 'package:api_demonster/Homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'APIpokemon.dart';
import 'package:api_demonster/screens/homepage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomePageList()),
    );
  }
}
