import 'package:flutter/material.dart';
import 'package:rest_bar/components/Cards/currentOrderCard.dart';
import 'package:rest_bar/theme/style.dart';
import 'style.dart';
import 'dart:async';

class DetallePedido extends StatefulWidget {
  final pedido;
  const DetallePedido({
    Key key, 
    this.pedido,
  }) : super(key: key);

  @override
  DetallePedidoState createState() => new DetallePedidoState(pedido: pedido);
}

class DetallePedidoState extends State<DetallePedido>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final pedido;
  final timeout = const Duration(seconds: 1);
  final ms = const Duration(milliseconds: 1);
  int time = 60;
  var actualTime = 60;
  DetallePedidoState({
    this.pedido,
  });
  
  @override
  Widget build(BuildContext context){
    final Size screenSize = MediaQuery.of(context).size;
    //startTimeout();
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: iconsAppbarColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: new Text('Detalle del pedido', style: titleStyle,),
      ),
      body: new Column(
        children: <Widget>[
          new Container( // StatusBar
            height: (screenSize.height / 12),
            padding: new EdgeInsets.all(5.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(10.0),
                  child: new Row(
                    children: <Widget>[
                      status(pedido['statusCode'], screenSize)
                    ],
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.all(5.0),
                  width: 60.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Icon(Icons.access_time),
                      new Text("$actualTime")
                    ],
                  ),
                )
              ],
            ),
          ),
          // Divisor
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 10.0),
            child: new Divider( color: secondaryColor,),
          ),
          new Container(
            height: (screenSize.height / 12) * 9,
            child: new SingleChildScrollView(
              child: new Column(
                children: <Widget>[
                  // Box de datos
                  new Container(
                    padding: paddingContainers,
                    child: new Column(
                      children: <Widget>[
                        _data(Icons.info_outline, pedido['id']),
                        _data(Icons.person_outline, pedido['name']),
                        _data(Icons.phone_android, pedido['number']),
                        _data(Icons.email, pedido['email']),
                        _data(Icons.reply_all, pedido['paymentType']),
                      ],
                    ),
                  ),
                  // Subtotal
                  new Container(
                    margin: new EdgeInsets.only(top: 5.0),
                    padding: paddingContainers,
                    child: new Column(
                      children: <Widget>[
                        new Container(),
                        new CurrentOrderCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Widget status(int code, screenSize){
    IconData icon;
    String text;
    if(code == 1){
      icon = Icons.warning;
      text = 'Pendiente';
    }
    return new Container(
      width: (screenSize.width / 12) * 4,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(icon),
          new Text(text, style: statusStyle,),
        ],
      ),
    );
  }

  Widget _data(IconData icon, title){
    return new Container(
      decoration: rowsDecoration,
      padding: paddingRows,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Icon(icon),
          new Container(width: 10.0,),
          new Text("$title", style: rowsTextStyle,),
        ],
      ),
    );
  }
  
  startTimeout([int milliseconds]){
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    print(actualTime);
    return new Timer(
      duration, 
      (){
        if(actualTime != 0){
          print('Vamonos');
          setState((){
            actualTime--;
          });
        }
      }
    );
  }
}