import 'package:flutter/material.dart';
import 'package:rest_bar/theme/style.dart';

class MenuCard extends StatelessWidget {
  String title, subtitle, price;
  AssetImage img;
  MenuCard({
    this.title,
    this.subtitle,
    this.price,
    this.img,
  });
  @override
  Widget build(BuildContext context) {
    print(img);
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
                      title: new Row(
                        children: <Widget>[
                          new Icon(Icons.attach_money),
                          new Text(
                            price,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new IconButton(
                          onPressed: (){},
                          icon: new Icon(Icons.add_circle_outline, color: secondaryColor,),
                        ),
                        new Text("0"),
                        new IconButton(
                          onPressed: (){},
                          icon: new Icon(Icons.remove_circle_outline, color: secondaryColor,),
                        )
                      ],
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
                      title: new Row(
                        children: <Widget>[
                          new Icon(Icons.attach_money),
                          new Text(
                            " "+price,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new IconButton(
                          onPressed: (){},
                          icon: new Icon(Icons.add_circle_outline, color: Colors.deepOrange,),
                        ),
                        new Text("0"),
                        new IconButton(
                          onPressed: (){},
                          icon: new Icon(Icons.remove_circle_outline, color: Colors.deepOrangeAccent,),
                        )
                      ],
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
