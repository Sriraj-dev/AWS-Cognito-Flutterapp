import 'package:aws_card_game/Screens/ForgotPasswordScreen.dart';
import 'package:aws_card_game/Screens/StartGame.dart';
import 'package:aws_card_game/Screens/confirmationscreen.dart';
import 'package:aws_card_game/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg1.jpg'), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email Id",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  controller: namecontroller,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  controller: passcontroller,
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        User user = User(
                            emailId: namecontroller.text,
                            password: passcontroller.text,
                            name: namecontroller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword(user)));
                      },
                      child: Text("Forgot Password?"),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    User user = User(
                        emailId: namecontroller.text,
                        password: passcontroller.text,
                        name: namecontroller.text);
                    bool isUser = await user.authenticateUser(
                        user.emailId, user.password);
                    if (isUser) {
                      print("Logging in!!");
                      print('Signed in as - ${user.emailId}');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartGame(user)));
                    } else {
                      final snackBar = SnackBar(
                        content: Text("Incorrect Credentials!"),
                        backgroundColor: Colors.red,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
                        behavior: SnackBarBehavior.floating,
                      );
                      //Scaffold.of(context).showSnackBar(snackBar);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade800,
                              Colors.blue.shade300,
                            ],
                          )),
                      child: Center(
                          child: Text(
                        "SignIn",
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ))),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    User user = User(
                        emailId: namecontroller.text,
                        password: passcontroller.text,
                        name: namecontroller.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ConfirmPage(user);
                    }));
                  },
                  child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade800,
                              Colors.blue.shade300,
                            ],
                          )),
                      child: Center(
                          child: Text(
                        "SignUp",
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// User user = User(
//     emailId: namecontroller.text,
//     password: passcontroller.text,
//     name: namecontroller.text);
// bool isUser = await user.authenticateUser(user.emailId, user.password);
// if(isUser){
// print("Logging in!!");
// }else{
// print("Provide Valid Details!");
// }

//
