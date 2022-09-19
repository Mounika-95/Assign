import 'package:assignment/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, right: 50, left: 50, bottom: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome home page ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Text("If you already signup login here"),
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }),
              child: Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 70, right: 70, bottom: 10),
                  child: Text(
                    "Login in",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              shape: StadiumBorder(),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
