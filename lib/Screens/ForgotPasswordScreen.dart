import 'package:aws_card_game/services.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  //const ForgotPassword({Key? key}) : super(key: key);
  User user;
  ForgotPassword(this.user);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState(user);
}

class _ForgotPasswordState extends State<ForgotPassword> {
  User user;
  _ForgotPasswordState(this.user);

  TextEditingController code = new TextEditingController();
  TextEditingController password = new TextEditingController();
  void forgotPassword()async{
   bool isSent = await user.forgotPassword(user.emailId);
   if(isSent){
        print('Mail sent to ${user.emailId}');
   }else{
     showDialog(
         context: context,
         barrierDismissible: false,
         builder: (BuildContext context) => AlertDialog(
           title: Text("Enter Valid Credentials!"),

           content: Text("Please Check your MailId"),
           actions: [
             ElevatedButton(
                 onPressed: () {
                   Navigator.pop(context);
                   Navigator.pop(context);
                 },
                 child: Text("Ok")),
           ],
         ));
   }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgotPassword();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg1.jpg'), fit: BoxFit.cover),
            ),
          ),
          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: TextField(
                  //keyboardType: TextInputType.number,
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "New Password",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
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
              SizedBox(height: 20,),

              GestureDetector(
                onTap: () async{
                  bool changed = await user.retrievePassword(user.emailId,code.text,password.text);
                  if(changed){
                    // final snackBar = SnackBar(
                    //   content: Text("Password Changed Successfully"),
                    //   backgroundColor: Colors.green,
                    //   margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
                    //   behavior: SnackBarBehavior.floating,
                    // );
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text("Password Changed Successfully!"),

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

                  }else{
                    final snackBar = SnackBar(
                      content: Text("Error in changing password"),
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
                          "Change Password",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ))),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
