import 'package:flutter/material.dart';


class ProductAdminCard extends StatelessWidget {
  String title, subtitle, price;
  var onPressedEdit, onPressedDelete;
  AssetImage img;
  ProductAdminCard({
    this.title,
    this.subtitle,
    this.price,
    this.img,
    this.onPressedDelete,
    this.onPressedEdit,
  });
  @override
  Widget build(BuildContext context) {
    String texto = '\$'+price;
    final Size screenSize = MediaQuery.of(context).size;
    if(img!=null){
      return ( new Card(
        elevation: 5.0,
        child: new Container(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          child: new Row(
            children: <Widget>[
              new Container(
                width: (screenSize.width/7)*4,
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text(
                        title, 
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    new ListTile(
                      title: new Text(subtitle),
                    ),
                    new ListTile(
                      leading: new Text(
                        texto,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      title: new IconButton(
                        onPressed: onPressedEdit,
                        icon: new Icon(Icons.edit),
                      ),
                      trailing: new IconButton(
                        onPressed: onPressedDelete,
                        icon: new Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: (screenSize.width/7)*3-28,
                child: new Image(image: img,),
              )
            ],
          ),
        ),
        )
      );
    }
    else{
      return ( new Card(
        elevation: 5.0,
        child: new Container(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          child: new Row(
            children: <Widget>[
              new Container(
                width: screenSize.width-18,
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text(
                        title, 
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    new ListTile(
                      title: new Text(subtitle),
                    ),
                    new ListTile(
                      leading: new Text(
                        texto,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      title: new IconButton(
                        onPressed: onPressedEdit,
                        icon: new Icon(Icons.edit),
                      ),
                      trailing: new IconButton(
                        onPressed: onPressedDelete,
                        icon: new Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ));
    }
  }
}
