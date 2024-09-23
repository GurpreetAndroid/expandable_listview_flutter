import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  String? name;
  SubCategory(this.name,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(name ?? "", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),),
        body: Center(child: Text(
        "This is $name category screen"
        ),)
    );
  }
}