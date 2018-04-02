import "package:flutter/material.dart";

class SideBar extends StatefulWidget{
  const SideBar({Key key}) : super(key: key);

  @override
  SideBarState createState()=>new SideBarState();

}

class SideBarState extends State<SideBar>{
  Widget build(BuildContext context){
    return (new Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(
            child: new Text('Lidanys'),
            decoration: new BoxDecoration(color: Colors.orange),
          ),
          new ListTile(
            title: new Text("Pedidos"),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/HomePage');
            },
          ),
          new ListTile(
            title: new Text('Sucursales'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/HomeAdminSucursales');
            },
          )
        ],
      ),
    ));
  }
}