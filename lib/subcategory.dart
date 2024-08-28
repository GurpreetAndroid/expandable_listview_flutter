

import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  String? name;
  SubCategory(this.name,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(name ?? ""),),
        body: Center(child: Text(
        "This is $name category screen"
        ),)
    );
  }
}