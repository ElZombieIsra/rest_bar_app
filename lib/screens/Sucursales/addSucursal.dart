import "package:flutter/material.dart";
import 'style.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class AddSucursales extends StatefulWidget{
const AddSucursales ({Key key}) : super(key:key);

@override
AddSucursalesState createState()=> new AddSucursalesState();

}

class AddSucursalesState extends State<AddSucursales>{
  final TextEditingController _controllerA = new TextEditingController();
  final TextEditingController _controllerB = new TextEditingController();
  Widget build(BuildContext context){
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Agregar sucursal"),
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Nombre',
                hintStyle: new TextStyle(color: Colors.black),
              ),
              controller: _controllerA,
            ),
          ),
          new Divider(),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Dirección',
                hintStyle: new TextStyle(color: Colors.black),
                
              ),
              controller: _controllerB,
            ),
          ),
          new Container(
            height: (screenSize.height)/1.7,
            child: new FlutterMap(
              options: new MapOptions(
                center: new LatLng(19.4300834, -99.1645669),
                zoom: 19.33,
              ),
              layers: [
                new TileLayerOptions(
                  urlTemplate: "https://api.tiles.mapbox.com/v4/"
                      "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1IjoiZWx6b21iaWVpc3JhIiwiYSI6ImNqZmlrYWM5eTBkZ3kzM29lbW13MHEwY3QifQ.jGBvPRMnPHyBk3IosGmbkg',
                    'id': 'mapbox.streets',
                  },
                ),
                new MarkerLayerOptions(
                  markers: [
                    new Marker(
                      width: 30.0,
                      height: 30.0,
                      point: new LatLng(19.4300834, -99.1645669),
                      builder: (ctx) =>
                      new Container(
                        child: new FlutterLogo(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]
      ),
      persistentFooterButtons: <Widget>[
        new RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: new Text(
            'Regresar',
            style: new TextStyle(color: Colors.black),
          ),
        ),
        new RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: new Text(
            'Agregar',
            style: new TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
} 