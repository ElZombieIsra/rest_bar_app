import 'package:flutter/material.dart';
import 'package:rest_bar/screens/Login/index.dart';
import 'package:rest_bar/screens/Home/index.dart';
import 'package:rest_bar/screens/Home/LoyaltyPlan/index.dart';
import 'package:rest_bar/screens/Home/Products/index.dart';
import 'package:rest_bar/screens/Home/PedidosPasados/index.dart';
import 'package:rest_bar/screens/HomeUser/index.dart';
import 'package:rest_bar/screens/HomeUser/Cart/orders.dart';
import 'package:rest_bar/screens/Sucursales/index.dart';
import 'package:rest_bar/screens/Sucursales/addSucursal.dart';
import 'package:rest_bar/screens/HomeUser/Cart/cart.dart';
import 'package:rest_bar/theme/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    // Rutas Admin
    "/HomePage": (BuildContext context) => new HomeScreen(),
    "/HomeAdminSucursales": (BuildContext context) => new AdminSucursales(),
    '/HomeAdminAddSucursales': (BuildContext context) => new AddSucursales(),
    '/HomeAdminCuenta' : (BuildContext context) => new LoyaltyPlan(),
    '/AdminPreviousOrders' : (BuildContext context) => new PreviousOrders(),
    '/AdminProductos' : (BuildContext context) => new Products(),
    // Rutas User
    "/HomePageUser": (BuildContext context) => new HomeUser(),
    '/UserOrders': (BuildContext context) => new OrdersUser(),
    '/CartUser' : (BuildContext context) => new Cart(),
  };

  Routes() {
    runApp(
      new MaterialApp(
        title: "Lidanys",
        home: new LoginScreen(),
        theme: appTheme,
        routes: routes,
      )
    );
  }
}
