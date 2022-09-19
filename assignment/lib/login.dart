import 'package:assignment/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  var _email = "";
  var _password = "";
  var _isloading = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.only(top: 10, right: 50, left: 50, bottom: 10),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextField(
                //   decoration: InputDecoration(label: Text("Login"),
                // ),

                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Email"),
                    hintText: "Enter email",
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return _email.contains("@") ? null : "Enter validate email";
                  },
                  onChanged: ((value) => setState(() {
                        _email = value;
                      })),
                ),
                SizedBox(
                  height: 30,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: "Enter Password",
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                  ),
                  validator: (value) {
                    return _password.length > 5
                        ? null
                        : "Password should contain min 6 characters";
                  },
                  onChanged: ((value) => setState(() {
                        _password = value;
                      })),
                ),

                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: (() {
                    Login();
                  }),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10, right: 90, left: 90, bottom: 10),
                    child: Text("Login",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  shape: StadiumBorder(),
                  color: Colors.blueAccent,
                ),
              ],
            ),
          )),
    );
  }

  void Login() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((User) {
        setState(() {
          _isloading = false;
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
            (Route<dynamic> route) => false);
        Fluttertoast.showToast(msg: 'Login succussfully');
      }).catchError((onError) {
        setState(() {
          _isloading = false;
        });
        Fluttertoast.showToast(msg: "error" + onError.toString());
      });
    }
  }
}
