import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import '../services/database.dart';
import '../widget/support_widget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  TextEditingController nameController=new TextEditingController();
  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage=File(image!.path);

  }
  Future getCameraImage() async {
    var image = await _picker.pickImage(source: ImageSource.camera);
    selectedImage=File(image!.path);
    setState(() {});
  }
  uploadItem() async {
    if(selectedImage!=null && nameController.text!=""){
      String addId= randomAlphaNumeric(10);
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImage").child(addId);
      final UploadTask uploadTask = firebaseStorageRef.putFile(selectedImage!);
      var dowloadUrl= await (await uploadTask).ref.getDownloadURL();
      Map<String,dynamic> addProduct={
        "Name":nameController.text,
        "Image":dowloadUrl,
      };
      await DatabaseMethods().addProduct(addProduct, value!).then((value){
        selectedImage=null;
        nameController.text="";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor : Colors.red,
            content: Text("Product added successfully",style: TextStyle(fontSize: 20.0),)));
      });
    }
  }
  String? value;
  final List<String> categoryitems = ['Watch', 'Laptop', 'Tv', 'Headphone'];
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
        margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "upload the Product image ",
              style: AppWidget.lightTextFeildStyle(),
            ),
            SizedBox(height: 20.0),
            selectedImage==null?GestureDetector(
              onTap: (){
                getImage();
              },
              child: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.camera_alt_outlined),
                ),
              ),
            ):Center(
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(20.0),
                child:  Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.file(selectedImage!, fit: BoxFit.cover)),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text("Product Name", style: AppWidget.lightTextFeildStyle()),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Product Name",
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text("Product Category", style: AppWidget.lightTextFeildStyle()),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items:
                      categoryitems
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: AppWidget.lightTextFeildStyle(),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged:
                      ((value) => setState(() {
                        this.value = value;
                      })),
                  dropdownColor: Colors.white,
                  hint: Text("Select Category"),
                  iconSize: 36,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  uploadItem();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,),
                child: Text(
                  "Add Product",
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
