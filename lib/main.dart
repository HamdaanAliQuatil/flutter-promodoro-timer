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
      child: ListView(
        children: showContacts(),
      ),
      // child: ListView.separated(
      //   itemBuilder:((context, index) => createSquare(index)),
      //   separatorBuilder: (context, index) => createSeparator(index),
      //   itemCount: 25,
        // verticalDirection: VerticalDirection.up,
        // textDirection: TextDirection.rtl,
        // children:createSquares(25),
      //   scrollDirection: Axis.vertical,
      // ),
    );
  }

  List<Widget> createSquares(int numSquares){
    int i = 0;
    List colors = [Colors.amber, Colors.deepPurple, Colors.deepOrange, Colors.indigo, Colors.lightBlue];
    List<Widget> squares = [];
    squares.add(Container(color: Colors.black,));
    while( i<numSquares){
      Container square = Container(
        color: colors[i%5],
        width: 100.0,
        height: 100.0,
        child: Text(i.toString()),
      );
      i++;
      squares.add(square);
    }
    return squares;
  }

  Widget createSquare(int position){

    List colors = [Colors.amber, Colors.deepPurple, Colors.deepOrange, Colors.indigo, Colors.lightBlue];
  
      Container square = Container(
        color: colors[position%5],
        width: 100.0,
        height: 100.0,
        child: Text(position.toString()),
      );

    return square;
  }

  Widget createSeparator(int position){
    Widget seperator = Container(
      height: 15,
      color: Colors.black,
    );
    return seperator;
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
    layoutChildren.add(backGround);
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
    layoutChildren.add(pizzaCard);
    Positioned buttonOrder = Positioned(
      bottom: sizeY /20,
      left: sizeX /20,
      width: sizeX - sizeX/10,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange[900],
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text('Order Now',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
      ),
      onPressed: (){},
      ),
      );
      layoutChildren.add(buttonOrder);
    return layoutChildren;
  }

  List<Contact> buildContacts(){
    List<Contact> contacts = [];
    contacts.add(Contact('Thomas Anderson', 'The Matrix', Icons.sentiment_neutral));
    contacts.add(Contact('Frank Slade', 'Scent of a woman', Icons.sentiment_satisfied));
    contacts.add(Contact('Mildred Hayes','Three Billboards outside Ebbing, NMissouri',Icons.sentiment_dissatisfied));
    contacts.add(Contact('Bruce Wayne', 'The Dark Knight', Icons.sentiment_neutral));
    contacts.add(Contact('Jamal Malik', 'The Millionaire', Icons.sentiment_neutral));
    return contacts;
  }

  List<ListTile> showContacts(){
    List<Contact> contacts = buildContacts();
    for(int i=0; i<20; i++){
      contacts.addAll(buildContacts());
    }
    List<ListTile> list = [];
    contacts.forEach((contact) {
      list.add(ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.subtile),
        leading: CircleAvatar(
          child: Icon(contact.icon),
          backgroundColor: Colors.amber[600],
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => true,
      ));
     });
     return list;
  }
}

class Contact{
  String name;
  String subtile;
  IconData icon;
  Contact(this.name, this.subtile, this.icon);
}
