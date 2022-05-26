// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        backgroundColor: Colors.indigo[100],
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: Stack(
        // verticalDirection: VerticalDirection.up,
        // textDirection: TextDirection.rtl,
        children:showPizzaLayout(sizeX, sizeY),
      ),
    );
  }

  List<Widget> createSquares(int numSquares){
    int i = 0;
    List colors = [Colors.amber, Colors.deepPurple, Colors.deepOrange, Colors.indigo, Colors.lightBlue];
    List<Widget> squares = [];
    squares.add(Container(color: Colors.black,));
    while( i<numSquares){
      Positioned square = Positioned(
        top: 100 + i.toDouble()*100,
        left: 40 + i.toDouble()*30,
        // alignment: Alignment.bottomRight,
        child: Container(
        color: colors[i],
        width: 60.0 * (numSquares-i),
        height: 60.0 *(numSquares - i),
        child: Text(i.toString()),
      ));
      i++;
      squares.add(square);
    }
    return squares;
  }

  List<Widget> showPizzaLayout(double sizeX, double sizeY){
    List<Widget> layoutChildren = [];
    Container backGround = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('http://bit.ly/pizza_image'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
    Positioned pizzaCard = Positioned(
      top: sizeY/20,
      left: sizeX/20,
      child: Card(
        elevation: 12,
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text("Pizza Margherita",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange[800],
            ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text("This delicious pizza is made of Tomato,\n Mozzarella and Basil. \n\n Seriously, you can't miss it.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),  
            ),
          ],
        ),
      ),
    );
    layoutChildren.add(backGround);
    layoutChildren.add(pizzaCard);
    return layoutChildren;
  }

}
