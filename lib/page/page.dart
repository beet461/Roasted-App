library page;

import 'package:flutter/material.dart';
import 'package:roasted/about/about.dart' as about;
import 'package:roasted/home/home.dart' as home;
import 'package:roasted/gen/gen.dart' as gen;

// page_num is the index of the Widget array pages, this is used in the bottom navigation bar
int page_num = 1;

// Page Widget
class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  PageState createState() => PageState();
}

class PageState extends State<Page> {
  // This function is called when a button is pressed on the bottom navigation bar, it reloads the page, but with a different index of <Widget>pages
  void onTap(int i) {
    setState(() {
      page_num = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Array of pages that are displayed
    // HomePage is given the onTap function because it needs to redirect to another page
    List<Widget> pages = <Widget>[
      gen.Gen(),
      home.HomePage(rel: onTap),
      about.About(),
    ];
    return Scaffold(
      body: Center(
        // Page is displayed according to page_num
        child: pages.elementAt(page_num),
      ),
      // Bottom navigation bar contains: generate, home, about in order
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
