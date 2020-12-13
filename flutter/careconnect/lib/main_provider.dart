import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {
  Future<dynamic> signIn(String email, String password) async {
    var response = await http.post(
      "https://care-connect-server.herokuapp.com/login",
      body: {
        "loginEmail": email.toString(),
        "loginPassword": password.toString(),
      },
    );
    dynamic res = jsonDecode(response.body);
    print(res);
    if (res["data"] != null) {
      print(res["data"]);
      return "Sign In Successfully";
    } else {
      return "Error";
    }
  }

  Future<dynamic> signUp(String name, String age, String weight, String height, String phoneNum,String email, String password) async {
    var response = await http.post(
      "https://care-connect-server.herokuapp.com/signup",
      body: {
        "name": name.toString(),
        "age": age.toString(),
        "weight": weight.toString(),
        "height": height.toString(),
        "phoneNum": phoneNum.toString(),
        "signupEmail": email.toString(),
        "signupPassword": password.toString()
      },
    );
    dynamic res = jsonDecode(response.body);
    print(res);
    if (res["data"] != null) {
      print(res["data"]);
      return "Sign Up Successfully";
    } else {
      return "Error";
    }
  }
}
