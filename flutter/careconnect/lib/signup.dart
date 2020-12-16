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
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String phoneNumber = '';
  String age = '';
  String weight = '';
  String height = '';
  String password = '';
  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: kBackgroundColor,
      ),
      backgroundColor: kBackgroundColorDark,
      body: Container(
        margin: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                //controller: name,
                validator: (val) => val.isEmpty ? 'Enter a Name' : null,
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
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
              TextFormField(
                style: TextStyle(color: Colors.white),
                //controller: email,
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Email",
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                ),
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                //controller: phoneNumber,
                validator: (val) => val.isEmpty ? 'Enter a Phone number' : null,
                onChanged: (val) {
                  setState(() {
                    phoneNumber = val;
                  });
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Phone Number",
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                ),
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                //controller: age,
                validator: (val) => val.isEmpty ? 'Enter your Age' : null,
                onChanged: (val) {
                  setState(() {
                    age = val;
                  });
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Age",
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                ),
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                //controller: weight,
                validator: (val) => val.isEmpty ? 'Enter an weight' : null,
                onChanged: (val) {
                  setState(() {
                    weight = val;
                  });
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Weight",
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                ),
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                //controller: height,
                validator: (val) => val.isEmpty ? 'Enter your Height' : null,
                onChanged: (val) {
                  setState(() {
                    height = val;
                  });
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Height",
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                ),
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                //controller: password,
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ char long' : null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Password",
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    final dynamic res =
                        await Provider.of<MainProvider>(context, listen: false).signUp(
                      name.toString(),
                      age.toString(),
                      weight.toString(),
                      height.toString(),
                      phoneNumber.toString(),
                      email.toString(),
                      password.toString(),
                    );

                    if (res != "Sign Up Successfully") {
                      setState(() {
                        error = 'Enter valid credentials';
                        loading = false;
                      });
                    } else {
                      setState(() {
                        loading = true;
                      });
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                    }
                  }
                },
                color: Colors.white,
                child: Text("Sign Up"),
                
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              )
              // FlatButton(
              //   onPressed: () async {
              //     setState(() {
              //       loading = false;
              //     });
              //     final dynamic res =
              //         await Provider.of<MainProvider>(context, listen: false)
              //             .signUp(
              //       name.toString(),
              //       age.toString(),
              //       weight.toString(),
              //       height.toString(),
              //       phoneNumber.toString(),
              //       email.toString(),
              //       password.toString(),
              //     );
              //     print(res);
              //     setState(() {
              //       if (res == "Sign Up Successfully") {
              //         setState(() {
              //           loading = true;
              //         });
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => LoginPage()));
              //       }
              //     });
              //   },
              //   color: Colors.white,
              //   //TODO
              //   child: loading == true ? Text("Sign Up") : Text("Signing Up"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
