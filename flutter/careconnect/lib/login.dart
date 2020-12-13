import 'package:careconnect/app_constants.dart';
import 'package:careconnect/pulsar_screen.dart';
import 'package:careconnect/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:careconnect/main_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: (){
            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupPage()));
          },
                  child: Container(
            height: 50,
            child: Center(
              child: Text("Dont have an Account? Sign Up"),
            ),
          ),
        ),
      ),
      backgroundColor: kBackgroundColorDark,
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
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
                        .signIn(email.text, password.text);
                print(res);
                setState(() {
                  if (res == "Sign In Successfully") {
                    setState(() {
                      loading = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PulsarScreen()));
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
