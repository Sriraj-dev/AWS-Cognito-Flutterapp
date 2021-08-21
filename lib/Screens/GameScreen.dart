import 'dart:math';

import 'package:aws_card_game/Card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  Random rnd = new Random();
  List<bool> canFlip = [true, true, true, true];
  List<int> v = [1,1,1,1];
  int count = 0;
  late int p1;
  late int p2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     v[0] = rnd.nextInt(50);
     v[1] = rnd.nextInt(50);
     v[2] = rnd.nextInt(50);
     v[3] = rnd.nextInt(50);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select a Card",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Hero(
                tag: 'Myhero',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlipCard(
                  flipOnTouch: canFlip[0],
                  onFlip: (){
                   // canFlip[0] = false;
                    setState(() {
                      canFlip[0] = false;
                      (count==0)?p1 = v[0]:p2 = v[0];
                      count+=1;
                    });
                    print('Card Flipped');

                  },
                  front: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.2,

                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('images/Colors.red.gif'),
                        )

                    ),

                  ),
                  back: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ],

                    ),
                    child: Center(
                      child: Text("${v[0]}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                  ),),
                    FlipCard(
                      flipOnTouch: canFlip[1],
                      onFlip: (){
                        setState(() {
                          canFlip[1] = false;
                          (count==0)?p1 = v[1]:p2 = v[1];
                          count+=1;
                        });
                        print('Card Flipped');
                      },
                      front: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.2,

                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue,
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage('images/Colors.blue.gif'),
                            )

                        ),

                      ),
                      back: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                            ),
                          ],

                        ),
                        child: Center(
                          child: Text("${v[1]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                      ),),
                    FlipCard(
                      flipOnTouch: canFlip[2],
                      onFlip: (){
                        setState(() {
                          canFlip[2] = false;
                          (count==0)?p1 = v[2]:p2 = v[2];
                          count+=1;
                        });
                        print('Card Flipped');
                      },
                      front: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.2,

                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.cyan,
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage('images/Colors.cyan.gif'),
                            )

                        ),

                      ),
                      back: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyan,
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                            ),
                          ],

                        ),
                        child: Center(
                          child: Text("${v[2]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                      ),),
                    FlipCard(
                      flipOnTouch: canFlip[3],
                      onFlip: (){
                        setState(() {
                          canFlip[3] = false;
                          (count==0)?p1 = v[3]:p2 = v[3];
                          count+=1;
                        });
                        print('Card Flipped');
                      },
                      front: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.2,

                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green,
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage('images/Colors.green.gif'),
                            )

                        ),

                      ),
                      back: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                            ),
                          ],

                        ),
                        child: Center(
                          child: Text("${v[3]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                      ),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 130,),
            !(count<=1)?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Player1 Score - $p1",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10,),
                Text("Player2 Score - $p2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 25,),
                Text((p1>p2)?'Player1 Won the game!':(p1==p2)?'Its a Tie Game!!':'Player2 Won the Game!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.blue,
                              )
                            ]),
                        child: Center(
                          child: Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GameScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.blue,
                              )
                            ]),
                        child: Center(
                          child: Text(
                            "Play Again!",
                            style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            )
                :Text(
                (count==0)?'Player1 Chance':'Player2 Chance',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}
