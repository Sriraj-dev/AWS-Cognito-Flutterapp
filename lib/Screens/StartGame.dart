import 'package:aws_card_game/Card.dart';
import 'package:aws_card_game/Screens/GameScreen.dart';
import 'package:aws_card_game/Screens/HomePage.dart';
import 'package:aws_card_game/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartGame extends StatefulWidget {
  //const StartGame({Key? key}) : super(key: key);
  User user;

  StartGame(this.user);

  @override
  _StartGameState createState() => _StartGameState(user);
}

class _StartGameState extends State<StartGame> {
  User user;

  _StartGameState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg4.gif'), fit: BoxFit.cover),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Im Pressed");
                          //Logout!
                          print('Trying to signout - ${user.emailId}');
                          user.signOut(user.emailId);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 3,
                                    color: Colors.blue)
                              ]),
                          child: Center(
                              child: Icon(
                            Icons.logout,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Hero(
                  tag: 'Myhero',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlaCard(Colors.red,2,false),
                      PlaCard(Colors.blue,2,false),
                      PlaCard(Colors.cyan,2,false),
                      PlaCard(Colors.green,2,false),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                GestureDetector(
                  onTap: () {
                    print("Im Pressed");
                    //Start game;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GameScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 5,
                            color: Colors.blue,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        "Start Game",
                        style: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
