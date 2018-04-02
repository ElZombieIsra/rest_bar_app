import 'package:flutter/material.dart';
import 'package:rest_bar/screens/Login/index.dart';
import 'package:rest_bar/screens/Home/index.dart';
import 'package:rest_bar/screens/HomeUser/index.dart';
import 'package:rest_bar/screens/Sucursales/index.dart';
import 'package:rest_bar/screens/Sucursales/addSucursal.dart';
import 'package:rest_bar/theme/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/HomePage": (BuildContext context) => new HomeScreen(),
    "/HomePageUser": (BuildContext context) => new HomeUser(),
    "/HomeAdminSucursales": (BuildContext context) => new AdminSucursales(),
    '/HomeAdminAddSucursales': (BuildContext context) => new AddSucursales(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Lidanys Test",
      home: new LoginScreen(),
      theme: appTheme,
      routes: routes,
    ));
  }
}
