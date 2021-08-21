import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
class PlaCard extends StatefulWidget {
  //const PlaCard({Key? key}) : super(key: key);
  Color myColor;
  int r;
  bool canFlip;
  PlaCard(this.myColor,this.r,this.canFlip);

  @override
  _PlaCardState createState() => _PlaCardState(myColor,r,canFlip);
}

class _PlaCardState extends State<PlaCard> {

  Color myColor;
  int r;
  bool canFlip;
  _PlaCardState(this.myColor,this.r,this.canFlip);
  late String color;
  @override
  Widget build(BuildContext context) {
    if(widget.myColor == Colors.red)
      color = 'Colors.red';
    else if(widget.myColor == Colors.blue)
      color = 'Colors.blue';
    else if(widget.myColor == Colors.cyan)
      color = 'Colors.cyan';
    else
      color = 'Colors.green';


    return FlipCard(
      flipOnTouch: canFlip,
      onFlip: (){
        canFlip = false;
        setState(() {
          canFlip = false;
        });
        print('Card Flipped');
      },
      onFlipDone: (x){
        print("Im done");
        canFlip = !x;
      },
      front: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.2,

        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.myColor,
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ],
          image: DecorationImage(
            image: AssetImage('images/$color.gif'),
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
                color: widget.myColor,
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],

        ),
        child: Center(
          child: Text("${widget.r}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

      ),
    );
  }
}
