import 'package:flutter/material.dart';
import 'package:app/widget/support_widget.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Categories = [
    "images/headphone_icon.png",
    "images/laptop.png",
    "images/TV.png",
    "images/watch.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Container(
        margin: EdgeInsets.only(top: 19.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hey, Adarsh", style: AppWidget.boldTextFeildStyle()),
                    Text(
                      "Good Morning",
                      style: AppWidget.lightTextFeildStyle(),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "images/boy.jpg",
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Container(
              // padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Products",
                  hintStyle: AppWidget.lightTextFeildStyle(),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories", style: AppWidget.semiTextFeildStyle()),
                Text("See all", style: AppWidget.oneTextFeildStyle()),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // width: 70,
                  // height:,
                  padding: EdgeInsets.all(30.0),
                  margin: EdgeInsets.only(right: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFfd6f3e),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(image: Categories[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All products", style: AppWidget.semiTextFeildStyle()),
                Text("See all", style: AppWidget.oneTextFeildStyle()),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height:240,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "images/watch.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "Watch",
                          style: AppWidget.semiTextFeildStyle(),
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Text(
                              "\$50",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 40.0),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7)),
                              child: Icon(
                                Icons.add,
                                color:Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "images/laptop.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "laptop",
                          style: AppWidget.semiTextFeildStyle(),
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Text(
                              "\$1000",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 40.0),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7)),
                              child: Icon(
                                Icons.add,
                                color:Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "images/headphone2.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "Headphone",
                          style: AppWidget.semiTextFeildStyle(),
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Text(
                              "\$100",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 40.0),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7)),
                              child: Icon(
                                Icons.add,
                                color:Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  String image;
  CategoryTile({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image, height: 50, width: 50, fit: BoxFit.cover),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
