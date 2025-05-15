import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../services/database.dart';
import '../services/shared_pref.dart';
import '../widget/support_widget.dart';
import 'bottomnav.dart';
import 'login.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  String? name,email ,password;
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  final formkey = GlobalKey<FormState>();
  register()async{
   if(password!=null && email!=null && name!=null){
     try{
       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);

       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           backgroundColor : Colors.green,
         content: Text("Register successfully",style: TextStyle(fontSize: 20.0),)));
       String Id = randomAlphaNumeric(10);
       await SharedPrefernceHelper().saveUserEmail(mailcontroller.text);
       await SharedPrefernceHelper().saveUserId(Id);
       await SharedPrefernceHelper().saveUserName(namecontroller.text);
       await SharedPrefernceHelper().saveUserImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png");
       Map<String,dynamic> userInfoMap = {
         "name":namecontroller.text,
         "email":mailcontroller.text,
        "Id": Id,
         "image":"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
       };
       await DatabaseMethods().addUserDetails(userInfoMap,Id);
       Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
     }on FirebaseException catch(e){
       if(e.code=='weak-password'){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
             backgroundColor : Colors.red,
             content: Text("password is weak",style: TextStyle(fontSize: 20.0),)));
       }
       else if(e.code=="email_already_in_use"){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
             backgroundColor : Colors.red,
             content: Text("Account already exsists",style: TextStyle(fontSize: 20.0),)));
       }
     }
   }
  }
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
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/login.png"),
                SizedBox(height: 20.0),
                Center(
                  child: Container(
                    height: 30,
                    width: 88,
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
            
                    child: Text("sign up", style: AppWidget.semiTextFeildStyle()),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Please enter the details below to\n                      continiue",
                  style: AppWidget.lightTextFeildStyle(),
                ),
                SizedBox(height: 40.0),
                Text("Name", style: AppWidget.semiTextFeildStyle()),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFF4F5F9),
                  ),
                  child: TextFormField(
                    validator: (value){
                      if (value==null || value.isEmpty){
                        return "please enter your name";
                      }

                        return null;


                    },
                    controller: namecontroller,
                    decoration: InputDecoration(border: InputBorder.none,hintText: "name"),
                  ),
                ),
                SizedBox(height: 20.0),
                Text("Email", style: AppWidget.semiTextFeildStyle()),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFF4F5F9),
                  ),
                  child: TextFormField(
                    validator: (value){
                      if (value==null || value.isEmpty){
                        return "please enter your mail";
                      }

                      return null;


                    },
                    controller: mailcontroller,
                    decoration: InputDecoration(border: InputBorder.none,hintText: "email",),
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
                    validator: (value){
                      if (value==null || value.isEmpty){
                        return "please enter your password";
                      }

                      return null;


                    },
                    controller: passwordcontroller,
                    decoration: InputDecoration(border: InputBorder.none,hintText: "password"),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                    if(formkey.currentState!.validate()){
                      setState(() {
                        name = namecontroller.text;
                        email = mailcontroller.text;
                        password = passwordcontroller.text;
                      });
                    }
                    register();
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
                          "Sing up",
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
                Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppWidget.lightTextFeildStyle(),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
                      },
                      child: GestureDetector(
                        onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>Login())),
                        child: Text(
                          "login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}