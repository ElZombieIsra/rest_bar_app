import 'package:flutter/material.dart';

class PriceList extends StatelessWidget{
  double price, fee, charge;
  PriceList({
    this.price,
    this.fee,
    this.charge,
  });
  @override
  Widget build(BuildContext contex){
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
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
                      charge.toString(),
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
        ],
      ),
    );
  }
}