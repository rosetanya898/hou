import 'package:flutter/material.dart';
import 'package:sahayi/screens/login.dart';
import 'package:sahayi/screens/signup.dart';
import 'package:sawo/sawo.dart';

Sawo sawo = Sawo(
  apiKey: "686a43b7-138f-446b-bf5b-0ad14b9f3ebf",
  secretKey: "*********",
);

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String user = "";

  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
    }
    setState(() {
      user = payload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset('assets/images/welcome.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: ClipOval(
                            child: Container(
                                width: 180,
                                height: 180,
                                color: Colors.blue[200],
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/SA1.jpg"))),
                      ),
                      SizedBox(height: 30),
                      Text('SAHAYI',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 40),
                      Text('Why not lend a helping hand today ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      SizedBox(height: 350),
                      ElevatedButton(
                        onPressed: () {
                          sawo.signIn(
                            context: context,
                            identifierType: 'email',
                            callback: payloadCallback,
                          );
                        },
                        child: Text(
                          "LOGIN with Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[100],
                            fixedSize: Size(80, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          sawo.signIn(
                            context: context,
                            identifierType: 'phone_number_sms',
                            callback: payloadCallback,
                          );
                        },
                        child: Text(
                          "Login with phone no.",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[100],
                            fixedSize: Size(80, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
