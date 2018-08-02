import "package:flutter/material.dart";
import 'package:rest_bar/theme/style.dart';

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
          const DrawerHeader(
            child: const Text('Lidanys', style: titleStyleBig,),
            decoration: const BoxDecoration(color: primaryColor),
          ),
          new ListTile(
            title: const Text("Pedidos"),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/HomePage');
            },
          ),
          new ListTile(
            title: const Text("Pedidos anteriores"),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/AdminPreviousOrders');
            },
          ),
          new ListTile(
            title: const Text('Sucursales'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/HomeAdminSucursales');
            },
          ),
          new ListTile(
            title: const Text('Cuenta'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/HomeAdminCuenta');
            },
          ),
          new ListTile(
            title: const Text('Productos'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/AdminProductos');
            },
          )
        ],
      ),
    ));
  }
}