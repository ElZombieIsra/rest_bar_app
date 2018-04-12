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
          const DrawerHeader(
            child: const Text('Lidanys'),
            decoration: const BoxDecoration(color: Colors.orange),
          ),
          new ListTile(
            title: const Text("Pedidos"),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/HomePage');
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