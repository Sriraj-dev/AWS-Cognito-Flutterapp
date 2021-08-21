//import 'package:aws_card_game/Screens/HomePage.dart';
import 'package:aws_card_game/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatefulWidget {
  //const ConfirmPage({Key? key}) : super(key: key);
  // String email;
  // String password;
  // String name;
  User user;

  //ConfirmPage(this.email, this.password, this.name);
  ConfirmPage(this.user);

  @override
  _ConfirmPageState createState() => _ConfirmPageState(user);
}

class _ConfirmPageState extends State<ConfirmPage> {
  // String email;
  // String password;
  // String name;
  User user;

  _ConfirmPageState(this.user);

  TextEditingController code = new TextEditingController();
  bool isLoading = true;

  void check() async {
    bool isRegistered = await User(
            emailId: user.emailId, password: user.password, name: user.name)
        .signUp();
    if (isRegistered) {
      setState(() {
        isLoading = false;
      });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => AlertDialog(
                title: Text("Enter Valid Credentials!"),
                content: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Text("-Please Check Your EmailId"),
                      Text(
                          "-Password Must Contain UpperCaseLetters,SpecialCharacters"),
                    ],
                  ),
                ),
                //content: Text("Please Enter Valid Credentials"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text("Ok")),
                ],
              ));

      //MaterialPageRoute(builder: (context) => HomePage())
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bg1.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Center(
                    child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                )),
              ],
            )
          : Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bg1.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("A Verification Code has been sent to your Mail Id",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: code,
                          decoration: InputDecoration(
                            hintText: "Enter Verification Code",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          bool isVerified =
                              await user.verifyUser(user.emailId, code.text);
                          if (isVerified) {
                            print("User is Verified");
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text("Successfully Registered!"),
                                  //content: Text("Please Enter Valid Credentials"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok")),
                                  ],
                                ));

                          } else {
                            final snackBar = SnackBar(
                              content: Text("InCorrect!!!"),
                              backgroundColor: Colors.red,
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
                              behavior: SnackBarBehavior.floating,
                            );
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
                              "Verify",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          user.resendCode(user.emailId);
                          final snackBar = SnackBar(
                            content: Text("Code Sent!"),
                            backgroundColor: Colors.green,
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
                            behavior: SnackBarBehavior.floating,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                              "Resend Code",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

//
// onTap: () async{
// bool isVerified = await user.verifyUser(user.emailId,code.text);
// if(isVerified){
// print("User is Verified");
// }else{
// print("User not verified");
// }
// },
