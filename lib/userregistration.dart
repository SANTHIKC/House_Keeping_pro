import 'package:flutter/material.dart';

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
  var formkey = GlobalKey<FormState>();
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
                      controller: nametextcontroller,
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
                      controller: passwordtextcontroller,
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
