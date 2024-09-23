import 'package:flutter/material.dart';
import 'datamodel.dart';
import 'subcategory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  List<Menu> listData = [];

  @override
  void initState() {
    dataList.forEach((element) {
      listData.add(Menu.fromJson(element));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(listData),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Expandable ListView", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) => _buildList(listData[index]),
      ),
    );
  }

  Widget _drawer(List<Menu> listData) {
    return Drawer(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.blue.shade800,
                          Colors.blue.shade300,
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 0.0),
                    accountName: const Text('Gurpreet Singh', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                    accountEmail: const Text('gurpreet.singh@xyz.com', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400))
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return _buildList(listData[index]);
                  },
                )
              ],
            ),
          ),
        )
    );
  }

  Widget _buildList(Menu list) {
    if (list.subCategory.isEmpty) {
      return Builder(
          builder: (context) {
            return ListTile(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(list.category))),
                leading: const SizedBox(),
                title: Text(list.category)
            );
          }
      );
    } else {
      return ExpansionTile(
        leading: Icon(list.icon),
        title: Text(
          list.category,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: list.subCategory.map(_buildList).toList(),
      );
    }
  }
}