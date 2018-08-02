import 'package:flutter/material.dart';
import 'package:rest_bar/theme/style.dart';

class CurrentOrderCard extends StatefulWidget{
  const CurrentOrderCard({Key key}) : super(key: key);
  
  @override
  CurrentOrderCardState createState() => new CurrentOrderCardState();
  //List orderProcess;
}

class CurrentOrderCardState extends State<CurrentOrderCard>{
  final orderProcess = [{
      'title':'asdkjas',
      'cuantity':'1',
      'price':'54',
    },
    {
      'title':'asdasdsa',
      'cuantity':'3',
      'price':'67',
    },
  ];
  ScrollController controller = new ScrollController();
  Widget build(BuildContext context){
  int price = _createPrice(orderProcess);
  double fee = _createFee(price);
    return new Card(
      elevation: 5.0,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //_rows(),
          new Container(
            height: 120.0,
            child: _rows(controller),
          ),
          new Container(
            child: new Divider(
              color: secondaryColor,
            ), 
            margin: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          ),
          new Container(
            padding: new EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  'Subtotal',
                  style: new TextStyle(
                    fontSize: 16.0
                  ),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      price.toString(),
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Icon(
                      Icons.attach_money,
                      size: 15.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          new Container(
            padding: new EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  'Cargo por servicio',
                  style: new TextStyle(color: Colors.grey[600]),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      fee.toString(),
                      style: new TextStyle(color: Colors.grey[600]),
                    ),
                    new Icon(
                      Icons.attach_money,
                      color: Colors.grey[600],
                      size: 14.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          new Container(
            padding: new EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  'Cargo por envío',
                  style: new TextStyle(color: Colors.grey[600]),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      '0.50'.toString(),
                      style: new TextStyle(color: Colors.grey[600]),
                    ),
                    new Icon(
                      Icons.attach_money,
                      color: Colors.grey[600],
                      size: 14.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          new Container(
            child: new Divider(
              color: secondaryColor,
            ), 
            margin: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          ),
          new ListTile(
            title: new Text(
              'Total',
              style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            trailing: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  (price+fee).toString(),
                  style: new TextStyle(
                    color: secondaryColor,
                    fontSize: 20.0
                  ),
                ),
                new Icon(
                  Icons.attach_money,
                  color: secondaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _rows(ScrollController controller){
    return new ListView.builder(
      controller: controller, 
      shrinkWrap: false,
      itemBuilder: (context, i){
        return new ListTile(
          title: new Row(
            children: <Widget>[
              new Text(orderProcess[i]['title']),
              new Text(
                ' (x'+orderProcess[i]['cuantity']+')',
                style: new TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          trailing: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(orderProcess[i]['price']),
              new Icon(Icons.attach_money, size: 16.0,),
            ],
          ),
        );
        (){
          print(orderProcess[i]);
        };
        return new ListTile(title: new Text('asdsda'),);
      },
      itemCount: orderProcess.length,
    );
  }
  _createPrice(List order){
    int price = 0;
    for(var num in order){
      price += int.parse(num['price']);
    }
    return price;
  }
  _createFee(int price){
    return double.parse(price.toString())*0.04;
  }
}