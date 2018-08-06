import "package:flutter/material.dart";
import "package:rest_bar/components/Cards/menuCard.dart";
import "package:rest_bar/components/SidebarUser/index.dart";
import 'style.dart';
import 'package:rest_bar/theme/style.dart';


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
      key: _scaffoldKey,
      // Barra lateral
      drawer: new SideBarUser(),
      appBar: new AppBar(
        // Botón que abre la barra lateral con color definido.
        leading:  new IconButton(
          icon: new Icon(Icons.dehaze), 
          color: iconsAppbarColor,
          // Función que abre la barra lateral
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        // Título de la vista
        title: const Text('Menú', style: titleStyle,),
        // Botón de carrito de compra
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.shopping_cart), 
            color: iconsAppbarColor, 
            onPressed: () => Navigator.pushNamed(context, '/CartUser'),
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            //color: thirdColor,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(4.0),
                  width: screenSize.width/3,
                  child: new RaisedButton(
                    color: secondaryColor,
                    shape: shapeButtons,
                    onPressed: (){},
                    child: new DropdownButton(
                      hint: new Text(
                        "Sucursales",
                        style: buttonsTextStyle,
                      ),
                      items: sucursales.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (_){},
                    ),
                  ),
                ),
                new Container(
                  width: (screenSize.width/3)*2,
                  child: new SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: new Container(
                      padding: new EdgeInsets.all(4.0),
                      child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: categorias.map((cat){
                        return new Container(
                          margin: new EdgeInsets.all(2.0),
                          child: new RaisedButton(
                            color: secondaryColor,
                            child: new Text(cat, style: buttonsTextStyle,),
                            onPressed:(){},
                            shape: shapeButtons
                          ),
                        );
                      }).toList(),
                    ),
                    )
                  ),
                )
              ],
            ),
          ),
          new Container(
            height: (screenSize.height/8)*6,
            child: new SingleChildScrollView(
              padding: new EdgeInsets.all(5.0),
              child: new Column(
                children: cards.map((prod){
                  // int index = cards.indexOf(prod);
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