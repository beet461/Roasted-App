library page;

import 'package:flutter/material.dart';
import 'package:roasted/about/about.dart' as about;
import 'package:roasted/home/home.dart' as home;
import 'package:roasted/gen/gen.dart' as gen;

int page_num = 1;

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  PageState createState() => PageState();
}

class PageState extends State<Page> {
  void onTap(int i) {
    setState(() {
      page_num = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      gen.Gen(),
      home.HomePage(rel: onTap),
      about.About(),
    ];
    return Scaffold(
      body: Center(
        child: pages.elementAt(page_num),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department), label: 'Generate'),
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Homepage'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'About'),
        ],
        currentIndex: page_num,
        onTap: onTap,
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.purple,
      ),
    );
  }
}
