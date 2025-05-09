import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/profile.dart';
import 'Order.dart';
import 'home.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<Bottomnav> {
  late List<Widget> pages;
  late Home Homepage;
  late Order order;
  late Profile profile;
  int currentTableIndex = 0;
  @override
  void initState() {
    // super.initState();
    Homepage = Home();
    order = Order();
    profile = Profile();
    pages = [Homepage, order, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height:65,
        backgroundColor:  Color(0xfff2f2f2),
        color: Colors.black,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            currentTableIndex = index;
          });
        },
        items: [
          Icon(Icons.home_outlined, color:  Color(0xfff2f2f2)),
          Icon(Icons.shopping_bag_outlined,  color: Color(0xfff2f2f2)),
          Icon(Icons.person_outline, color: Color(0xfff2f2f2)),
        ],
      ),
      body: pages[currentTableIndex],
    );
  }
}
