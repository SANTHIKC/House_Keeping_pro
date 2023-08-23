

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'employeviewpage.dart';



class EmployeeRegistration extends StatefulWidget {
  const EmployeeRegistration({Key? key}) : super(key: key);

  @override
  State<EmployeeRegistration> createState() => _EmployeeRegistrationState();
}

class _EmployeeRegistrationState extends State<EmployeeRegistration> {
  TextEditingController nametextcontroller=TextEditingController();
  TextEditingController emailtextcontroller=TextEditingController();
  TextEditingController passwordtextcontroller=TextEditingController();
  TextEditingController addresstextcontroller=TextEditingController();
  TextEditingController phonenotextcontroller=TextEditingController();
  TextEditingController experiencetextcontroller=TextEditingController();
  TextEditingController servicetextcontroller=TextEditingController();

  var formkey = GlobalKey<FormState>();
  File? pickedImage;

  void imagePickerOption()
  {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0)
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Pic Image From",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(onPressed: (){
                    pickImage(ImageSource.camera);
                  }, icon: Icon(Icons.camera_alt), label:Text("Camera")),
                  ElevatedButton.icon(onPressed: (){
                    pickImage(ImageSource.gallery);
                  }, icon: Icon(Icons.image), label:Text("Gallery")),
                ],
              ),
            ),
          ),
        ),
      )

    );
  }

  pickImage(ImageSource imageType)async{
    try{
    final photo = await ImagePicker().pickImage(source: imageType);
    if(photo==null) return;
    final tempImage =File(photo.path);
    setState(() {
      pickedImage =tempImage;
    });
    Get.back();

    }
    catch(error){
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                        Container(
                          decoration:BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(90),),
                          ),
                          child: ClipOval(

                             child  :
                              pickedImage !=null ?Image.file(pickedImage!,
                              width:170,
                              height: 170,
                              fit: BoxFit.cover,) :

                             Image.asset('assetss/profilepic.jpg'),
                          ),
                        ),
                          Positioned(
                            bottom: 0,
                              right: 5,
                              child: IconButton(onPressed: imagePickerOption,
                              icon: Icon(Icons.add_a_photo,size: 30,)
                                ,))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("NAME"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: nametextcontroller,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "enter name";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Email"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: emailtextcontroller,
                      validator: (m) {
                        if (m!.isEmpty) {
                          return "enter email";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "email",
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Password"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: passwordtextcontroller,
                      validator: (o) {
                        if (o!.isEmpty)  {
                          return "enter password";
                        }
                        if (o!.length < 6) {
                          return "minimum 6 characters";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("ADDRESS"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: addresstextcontroller,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "enter your address";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Phone Number"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: phonenotextcontroller,
                      validator: (o) {
                        if (o!.isEmpty)  {
                          return "enter Phone number";
                        }
                        if (o!.length < 10) {
                          return "minimum 10 numbers";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        suffixIcon: Icon(Icons.call),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('Experience'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: experiencetextcontroller,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "enter your experience";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Year of experience",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Service Type"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: servicetextcontroller,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "enter your service type";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Service Type",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),





                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          bool validate = formkey.currentState!.validate();
                          if(validate == false)
                          {
                            return;

                          }
                          else
                            {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return EmployeeViewpage();
                              },));
                            }

                        },
                        child: Text("Submit")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}


