import "package:flutter/material.dart";
import 'package:rest_bar/theme/style.dart';

class SideBarUser extends StatefulWidget{
  const SideBarUser({Key key}) : super(key: key);

  @override
  SideBarUserState createState()=>new SideBarUserState();

}

class SideBarUserState extends State<SideBarUser>{
  Widget build(BuildContext context){
    return (new Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(
            child: new Text('Lidanys', style: titleStyleBig,),
            decoration: new BoxDecoration(color: primaryColor),
          ),
          new ListTile(
            title: new Text("Menú"),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/HomePageUser');
            },
          ),
          new ListTile(
            title: new Text('Órdenes'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/UserOrders');
            },
          ),
          new ListTile(
            title: new Text('Carrito'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/CartUser');
            },
          ),
        ],
      ),
    ));
  }
}