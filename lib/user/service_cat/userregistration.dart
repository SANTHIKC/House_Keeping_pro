import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import '../../appConstants/appConstants.dart';
import '../../homescreen/loginhomepage.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({Key? key}) : super(key: key);

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  TextEditingController nametextcontroller=TextEditingController();
  TextEditingController emailtextcontroller=TextEditingController();
  TextEditingController passwordtextcontroller=TextEditingController();
  TextEditingController addresstextcontroller=TextEditingController();
  TextEditingController phonenotextcontroller=TextEditingController();

  void  senddata()async
  {
    var request =  MultipartRequest("POST",Uri.parse("${AppConstants.url}userinsertdata.php"));
    request.fields["user_name"]=nametextcontroller.text;
    request.fields["email"]=emailtextcontroller.text;
    request.fields["password"]=passwordtextcontroller.text;
    request.fields["address"]=addresstextcontroller.text;
    request.fields["phone_number"]=phonenotextcontroller.text;

    request.files.add(MultipartFile.fromBytes("photo", File(pickedImage!.path).readAsBytesSync(),filename: pickedImage!.path));


    var response  =  await request.send();
    if(response.statusCode ==200){
      var gettngData =await Response.fromStream(response);
      print(gettngData.body);
      var userdata=jsonDecode(gettngData.body);
      if(userdata["message"]=="Added")
      {
        print("userregisterdata added");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const Signinhome();
        },));
      }



    }
  }

  var formkey = GlobalKey<FormState>();
  File? pickedImage;

  void imagePickerOption()
  {
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: Container(
          color: Colors.white,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Pic Image From",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(onPressed: (){
                  pickImage(ImageSource.camera);
                }, icon: const Icon(Icons.camera_alt), label:const Text("Camera")),
                ElevatedButton.icon(onPressed: (){
                  pickImage(ImageSource.gallery);
                }, icon: const Icon(Icons.image), label:const Text("Gallery")),
              ],
            ),
          ),
        ),
      );


    },);
  }

  pickImage(ImageSource imageType)async{
    try{
      final photo = await ImagePicker().pickImage(source: imageType);
      if(photo==null) return;
      final tempImage =File(photo.path);
      setState(() {
        pickedImage =tempImage;
      });


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
                              borderRadius: const BorderRadius.all(Radius.circular(90),),
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
                                icon: const Icon(Icons.add_a_photo,size: 30,)
                                ,))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
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

                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
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
                        suffixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
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
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
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

                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
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
                        suffixIcon: const Icon(Icons.call),
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
                          if(validate == true)
                          {
                            senddata();
                          }
                          else
                          {

                          }

                        },
                        child: const Text("Submit")),
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
