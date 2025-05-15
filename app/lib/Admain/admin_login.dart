import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widget/support_widget.dart';
import 'home_admin.dart';
class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller= new TextEditingController();
  TextEditingController userpasswordcontroller= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 40.0,
            left: 20.0,
            right: 20.0,
            bottom: 40.0,
          ),
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/login.png"),
                SizedBox(height: 20.0),
                Center(
                  child: Container(
                    height: 30,
                    width: 150,

                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child: Center(

                        child: Text("Admin panel", style: AppWidget.semiTextFeildStyle())),
                  ),
                ),
                SizedBox(height: 20.0),


                Text("Username", style: AppWidget.semiTextFeildStyle()),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFF4F5F9),
                  ),
                  child: TextFormField(

                    controller: usernamecontroller,
                    decoration: InputDecoration(border: InputBorder.none,hintText: "Username"),
                  ),
                ),

                SizedBox(height: 20.0),
                Text("Password", style: AppWidget.semiTextFeildStyle()),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFF4F5F9),
                  ),
                  child: TextFormField(
                    obscureText: true,

                    controller: userpasswordcontroller,
                    decoration: InputDecoration(border: InputBorder.none,hintText: "password"),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                  AdminLogin();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      );

  }
  AdminLogin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach((result) {
         if(result.data()["username"]!=usernamecontroller.text ){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
               backgroundColor : Colors.red,
               content: Text("Username is incorrect",style: TextStyle(fontSize: 20.0),)));
         }
         else if(result.data()["password"]!=userpasswordcontroller.text){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
               backgroundColor : Colors.red,
               content: Text("Password is incorrect",style: TextStyle(fontSize: 20.0),)));
         }
         else{
           Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeAdmin()));
         }
      });
    });
  }
 }


