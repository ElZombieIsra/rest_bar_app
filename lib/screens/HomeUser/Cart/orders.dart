import "package:flutter/material.dart";
import "package:rest_bar/components/SidebarUser/index.dart";
import "package:rest_bar/components/Cards/currentOrderCard.dart";

class OrdersUser extends StatefulWidget{
  const OrdersUser({Key key}) : super(key: key);
  
  @override
  OrdersUserState createState() => new OrdersUserState();

}

class OrdersUserState extends State<OrdersUser>{
  Color _underlineColor1 = Colors.orange, _underlineColor2 = Colors.white10, _textColor1 = Colors.orange, _textColor2 = Colors.grey;
  var b = true;
  final orderProcess = [{
      'title':'',
      'cuantity':'',
      'price':'',
    },
    {
      'title':'',
      'cuantity':'',
      'price':'',
    },];
  Widget build(BuildContext context){
    changeColor(b){
      if(b){
        setState((){
          _underlineColor1 = _textColor1 = Colors.orange;
          _underlineColor2 = Colors.white;
          _textColor2 = Colors.grey;
        });
      } else if(!b){
        setState((){
          _underlineColor2 = _textColor2 = Colors.orange;
          _underlineColor1 = Colors.white;
          _textColor1 = Colors.grey;
        });
      }
    }
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      drawer: new SideBarUser(),
      appBar: new AppBar(
        title: const Text('Órdenes'),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.only(bottom: 1.5),
                  color: _underlineColor1,
                  height: screenSize.height/13,
                  child: new Container(
                    color: Colors.white,
                    child: new FlatButton(
                      onPressed: (){
                        changeColor(true);
                      },
                      child: new Text(
                        'En proceso',
                        style: new TextStyle(
                          color: _textColor1,
                        ),
                      ),
                    ),
                  ),
                ),
                new Container(
                  padding: new EdgeInsets.only(bottom: 1.5),
                  color: _underlineColor2,
                  height: screenSize.height/13,
                  child: new Container(
                    color: Colors.white,
                    child: new FlatButton(
                      onPressed: (){changeColor(false);},
                      child: new Text(
                        'Órdenes pasadas',
                        style: new TextStyle(
                          color: _textColor2,
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
          new Container(
            height: screenSize.height/6,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(height: 5.0,),
                    new Text(
                      '1:00pm',
                      style: new TextStyle(
                        color: Colors.orange[300],
                        fontSize: 9.0,
                      ),
                    ),
                    new Text(
                      'Órden recibida',
                      style: new TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10.0,
                      ),
                    ),
                    new Container(
                      width: screenSize.width/7,
                      height: screenSize.height/10,
                      decoration: new BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                      child: new Icon(Icons.done_all, color: Colors.white, size: 35.0,),
                    ),
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(height: 5.0,),
                    new Text(
                      '1:03pm',
                      style: new TextStyle(
                        color: Colors.orange[300],
                        fontSize: 9.0,
                      ),
                    ),
                    new Text(
                      'Preparando',
                      style: new TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10.0,
                      ),
                    ),
                    new Container(
                      width: screenSize.width/7,
                      height: screenSize.height/10,
                      decoration: new BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                      child: new Icon(Icons.restaurant_menu, color: Colors.white, size: 35.0,),
                    ),
                  ],
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(height: 5.0,),
                    new Text(
                      '_',
                      style: new TextStyle(
                        color: Colors.grey[400],
                        fontSize: 9.0,
                      ),
                    ),
                    new Text(
                      'Entregado',
                      style: new TextStyle(
                        color: Colors.grey[400],
                        fontSize: 10.0,
                      ),
                    ),
                    new Container(
                      width: screenSize.width/7,
                      height: screenSize.height/10,
                      decoration: new BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                      child: new Icon(Icons.home, color: Colors.white, size: 35.0,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          new Container(
            height: (screenSize.height/5)*3+10,
            child: new SingleChildScrollView(
              padding: new EdgeInsets.all(1.0),
              child: new CurrentOrderCard(),
            ),
          ),
        ],
      ),
    );
  }
}