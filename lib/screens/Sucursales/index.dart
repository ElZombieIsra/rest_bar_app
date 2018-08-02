import "package:flutter/material.dart";
import 'style.dart';
import 'package:rest_bar/components/SideBar/index.dart';
import 'package:rest_bar/components/Cards/sucursalesCard.dart';
import 'package:rest_bar/theme/style.dart';

class AdminSucursales extends StatefulWidget{
const AdminSucursales ({Key key}) : super(key:key);

@override
AdminSucursalesState createState()=> new AdminSucursalesState();

}

class AdminSucursalesState extends State<AdminSucursales>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final cards = [
    {
      'nameSucursal':'Alemán',
      'sucursalLocation':'Av. Alemán 22'
    },
    {
      'nameSucursal':'Juárez',
      'sucursalLocation':'Av. Juárez 6'
    }
  ];
  Widget build(BuildContext context){
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new SideBar(),
      appBar: new AppBar(
        leading:  new IconButton(
          icon: new Icon(Icons.dehaze), 
          color: iconsAppbarColor,
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: const Text("Sucursales", style: titleStyle,),
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
            height: (screenSize.height/6),
            child: new ListTile(
              title: new RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/HomeAdminAddSucursales');
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Icon(Icons.add_location),
                    new Text(
                      "Agregar sucursales",
                      style: titleStyleWidget,
                    ),
                    new Container()
                  ],
                ),
              ),
            ),
          ),
          new Container(
            padding: new EdgeInsets.all(5.0),
            child: new SingleChildScrollView(
              child: new Column(
                children: cards.map((suc){
                  int index = cards.indexOf(suc);
                  return new SucursalesCard(
                    index: index,
                    nameSucursal: suc['nameSucursal'],
                    sucursalLocation: suc['sucursalLocation'],
                    onPressedEdit: (){},
                    onPressedDelete: (){
                      _showAlert(
                        context, 
                        'Alerta', 
                        '¿Estás seguro que queires borrar esta sucursal?', 
                        'Borrar', 
                        'Regresar', 
                        (){
                          setState((){
                            cards.remove(suc);
                          });
                          Navigator.pop(context);
                        }, 
                        (){
                          Navigator.pop(context);
                        }
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
  _showAlert(BuildContext context, title, description, titleAccept, titleError, accept, error) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        title: new Text(title),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text(description),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text(titleError),
            onPressed: error,
          ),
          new FlatButton(
            child: new Text(titleAccept),
            onPressed: accept,
          ),
        ],
      ),
    ); 
  }
} 