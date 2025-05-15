import 'package:flutter/material.dart';

import '../widget/support_widget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },

          child: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          "              Add Product",
          style: AppWidget.semiTextFeildStyle(),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 20.0),
          child: Column(children: [
        Text("upload the Product image ",style: AppWidget.lightTextFeildStyle(),)
      ])),
    );
  }
}
