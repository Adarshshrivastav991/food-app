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
    // 1. Validate all required fields
    if (selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select an image"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter product name"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (value == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select a category"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // 2. Verify the image file exists
    if (!await selectedImage!.exists()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Selected image file no longer exists"),
          backgroundColor: Colors.red,
        ),
      );
      setState(() => selectedImage = null);
      return;
    }

    try {
      // 3. Show loading state
      setState(() {});

      // 4. Upload to Firebase Storage
      String addId = randomAlphaNumeric(10);
      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child("productImages")  // Changed from "blogImage" to "productImages"
          .child(addId);

      // 5. Start upload task
      TaskSnapshot uploadTask = await storageRef.putFile(selectedImage!);

      // 6. Get download URL
      String downloadUrl = await uploadTask.ref.getDownloadURL();

      // 7. Prepare product data
      Map<String, dynamic> productData = {
        "Name": nameController.text,
        "Image": downloadUrl,
        "Category": value!,
        "createdAt": DateTime.now().millisecondsSinceEpoch,
      };

      // 8. Save to Firestore
      await DatabaseMethods().addProduct(productData, value!);

      // 9. Reset form and show success
      setState(() {
        selectedImage = null;
        nameController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product added successfully!"),
          backgroundColor: Colors.green,
        ),
      );

    } catch (e) {
      // 10. Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to upload: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {});
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
