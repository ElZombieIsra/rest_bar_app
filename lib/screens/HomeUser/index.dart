import "package:flutter/material.dart";
import "package:rest_bar/components/Cards/orderCard.dart";
import "package:rest_bar/components/Cards/menuCard.dart";
import 'style.dart';


class HomeUser extends StatefulWidget {
const HomeUser({ Key key }) : super(key: key);

@override
HomeUserState createState() => new HomeUserState();

}

class HomeUserState extends State<HomeUser>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();
  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
  final cards = [{
      'title':'Hawaiana',
      'subtitle':'Lorem ipsum dolor sit amet',
      'price':'657',
      'img':pizzaImg3,
    },
    {
      'title':'Ranchera',
      'subtitle':'Lorem ipsum dolor sit amet',
      'price':'2039',
    },
    {
      'title':'Mexicana',
      'subtitle':'Lorem ipsum dolor sit amet',
      'price':'277',
    }];
  final sucursales = ['uhs', 'kjh', '34e'];
  final categorias = ['Hamburguesas', 'Especiales', 'Postres', 'Tamarindos'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Se itera por la lista regresando las cards a una lista 
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Menú'),
      ),
      body: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new DropdownButton(
                hint: new Text(
                  "Sucursales",
                  style: new TextStyle(color: Colors.black),
                ),
                items: sucursales.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_){},
              ),
              new Container(
                width: (screenSize.width/3)*2,
                child: new SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: categorias.map((cat){
                      return new RaisedButton(
                        child: new Text(cat),
                        onPressed:(){},
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
          new Container(
            height: (screenSize.height/5)*4,
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
        ],
      ),
    );
  }
}