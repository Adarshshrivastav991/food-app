import 'package:flutter/material.dart';
import 'package:app/pages/singup.dart';
import 'package:app/widget/support_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0,bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/login.png"),
              Center(
                child: Container(
                  height: 30,
                  width: 80,
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child: Text("sign in", style: AppWidget.semiTextFeildStyle()),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Please enter the details below to\n                      continiue",
                style: AppWidget.lightTextFeildStyle(),
              ),
              SizedBox(height: 40.0),
              Text("Email", style: AppWidget.semiTextFeildStyle()),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF4F5F9),
                ),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
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
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      "Forget Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text("Don't have an account?",style: AppWidget.lightTextFeildStyle(),),
                  GestureDetector(onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>Singup())),
                      child: Text("Sing up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500,fontSize: 15.0),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
