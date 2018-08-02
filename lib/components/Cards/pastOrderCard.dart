import 'package:flutter/material.dart';
import 'package:rest_bar/theme/style.dart';

class PastOrderCard extends StatelessWidget{
  String cardTitle, orderId, orderDate;
  double orderPrice;
  Color iconsColor = Colors.black;
  PastOrderCard({
    this.cardTitle,
    this.orderId,
    this.orderPrice,
    this.orderDate,
  });
  @override
  Widget build(BuildContext context){
    return new Card(
      elevation: 5.0,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            leading: new Container(
              child: new Icon(Icons.shopping_basket, color: iconsColor,),
              width: 200.0,
            ),
            title: new Text('Order id - ' + orderId),
          ),
          new Divider(),
          new ListTile(
            title: new Text(cardTitle + ' - \$$orderPrice'),
            trailing: new Text(orderDate),
          )
        ],
      ),
    );
  }
}