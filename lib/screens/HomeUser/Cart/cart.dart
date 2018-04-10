import "package:flutter/material.dart";
import "package:rest_bar/components/Cards/menuCard.dart";
import "package:rest_bar/components/SidebarUser/index.dart";
import "package:rest_bar/components/PricesList/index.dart";
import 'package:rest_bar/screens/HomeUser/style.dart';

class Cart extends StatefulWidget{
  const Cart({Key key}) : super (key : key);

  @override
  State<StatefulWidget> createState() => new CartState();

}

class CartState extends State<Cart>{
  final cards = [{
      'title':'Hawaiana',
      'subtitle':'Rica pizza con piña y jamón',
      'price':'13.0',
      'img':pizzaImg3,
    }];
  Widget build(BuildContext context){
    double price = 0.0, fee = 5.0, charge = 0.7;
    cards.forEach((prod){
      price = price + double.parse(prod['price']);
      print(price);
      print(prod['price']);
    });
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      drawer: new SideBarUser(),
      appBar: new AppBar(
        title: const Text('Carrito de compra'),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
             height: (screenSize.height/3)*2-8,
            child: new SingleChildScrollView(
              padding: new EdgeInsets.all(5.0),
              child: new Column(
                children: cards.map((prod){
                  int index = cards.indexOf(prod);
                  return new MenuCard(
                    title: prod['title'],
                    subtitle: prod['subtitle'],
                    price: prod['price'],
                    img: prod['img'],
                  );
                }).toList(),
              ),
            ),
          ),
          new PriceList(
            price: price,
            fee: fee,
            charge: charge,
          ),
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.orange[400],
        child: new ListTile(
          title: new Text(
            'Proceder al pago',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0, 
            ),
          ),
          trailing: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text(
                'Pagar',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              new Container(width: 5.0,),
              new Text(
                (price + fee + charge).toString(),
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              new Container(width: 8.0,),
              new Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18.0,
              ),
            ],
          )
        ),
      ),
    );
  }
}