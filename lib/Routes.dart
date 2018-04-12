import 'package:flutter/material.dart';
import 'package:rest_bar/screens/Login/index.dart';
import 'package:rest_bar/screens/Home/index.dart';
import 'package:rest_bar/screens/Home/LoyaltyPlan/index.dart';
import 'package:rest_bar/screens/Home/Products/index.dart';
import 'package:rest_bar/screens/HomeUser/index.dart';
import 'package:rest_bar/screens/HomeUser/Cart/orders.dart';
import 'package:rest_bar/screens/Sucursales/index.dart';
import 'package:rest_bar/screens/Sucursales/addSucursal.dart';
import 'package:rest_bar/screens/HomeUser/Cart/cart.dart';
import 'package:rest_bar/theme/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/HomePage": (BuildContext context) => new HomeScreen(),
    "/HomePageUser": (BuildContext context) => new HomeUser(),
    "/HomeAdminSucursales": (BuildContext context) => new AdminSucursales(),
    '/HomeAdminAddSucursales': (BuildContext context) => new AddSucursales(),
    '/HomeAdminCuenta' : (BuildContext context) => new LoyaltyPlan(),
    '/UserOrders': (BuildContext context) => new OrdersUser(),
    '/CartUser' : (BuildContext context) => new Cart(),
    '/AdminProductos' : (BuildContext context) => new Products(),
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
