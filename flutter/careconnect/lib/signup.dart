import 'package:careconnect/app_constants.dart';
import 'package:careconnect/login.dart';
import 'package:careconnect/pulsar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:careconnect/main_provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: kBackgroundColor,
      ),
      backgroundColor: kBackgroundColorDark,
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Name",
                focusColor: Colors.white,
                fillColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: email,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Email",
                focusColor: Colors.white,
                fillColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: phoneNumber,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Phone Number",
                focusColor: Colors.white,
                fillColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: age,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Age",
                focusColor: Colors.white,
                fillColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: weight,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Weight",
                focusColor: Colors.white,
                fillColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: height,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Height",
                focusColor: Colors.white,
                fillColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: password,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Password",
                focusColor: Colors.white,
                fillColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
            FlatButton(
              onPressed: () async {
                setState(() {
                  loading = false;
                });
                final dynamic res =
                    await Provider.of<MainProvider>(context, listen: false)
                        .signUp(
                  name.text.toString(),
                  age.text.toString(),
                  weight.text.toString(),
                  height.text.toString(),
                  phoneNumber.text.toString(),
                  email.text.toString(),
                  password.text.toString(),
                );
                print(res);
                setState(() {
                  if (res == "Sign Up Successfully") {
                    setState(() {
                      loading = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()));
                  }
                });
              },
              color: Colors.white,
              child: loading == true ? Text("Sign In") : Text("Signing In"),
            ),
          ],
        ),
      ),
    );
  }
}
