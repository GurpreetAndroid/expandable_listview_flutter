import 'package:flutter/material.dart';

List dataList = [
  {
    "category": "Mobiles",
    "icon": Icons.mobile_friendly,
    "subCategory": [
      {"category": "Android Mobile"},
      {"category": "iOS Mobile"}
    ]
  },
  {
    "category": "Electronics",
    "icon": Icons.store,
    "subCategory": [
      {
        "category": "Camera & Accessories",
        "subCategory": [
          {"category": "DSLR"},
          {"category": "Camera Lenses"},
          {"category": "Camcorders"}
        ]
      },
      {
        "category": "Laptop and Desktop",
        "subCategory": [
          {"category": "Laptops"},
          {"category": "Gaming Laptops"},
          {"category": "Desktop PCs"}
        ]
      },
      {
        "category": "Gaming",
        "subCategory": [
          {"category": "Gaming Mouse"},
          {"category": "Gaming COnsole"}
        ]
      },
      {
        "category": "Mobile Accessory",
        "subCategory": [
          {"category": "Mobile Cabels"},
          {"category": "Mobile Holder"},
          {"category": "Screen Guards"}
        ]
      }
    ]
  }
];

class Menu {
    String category ="";
    IconData icon=Icons.payment;
    List<Menu> subCategory = [];

  Menu({required this.category, required this.subCategory, required this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    icon = json['icon'] !=null ? json['icon'] : Icons.star_border ;
    if (json['subCategory'] != null) {
      subCategory.clear();
      json['subCategory'].forEach((v) {
        subCategory?.add(new Menu.fromJson(v));
      });
    }
  }
}
