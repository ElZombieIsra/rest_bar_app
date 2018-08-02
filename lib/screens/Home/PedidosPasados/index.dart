import "package:flutter/material.dart";
import "package:rest_bar/components/Cards/orderCard.dart";
import 'package:rest_bar/components/SideBar/index.dart';
import 'package:rest_bar/theme/style.dart';

class PreviousOrders extends StatefulWidget {
  const PreviousOrders({ Key key }) : super(key: key);

  @override
  PreviousOrdersState createState() => new PreviousOrdersState();

}

class PreviousOrdersState extends State<PreviousOrders>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // Controlador de scroll
  ScrollController scrollController = new ScrollController();

  // Muestra el texto recibido en un snackbar
  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  // Pedidos
  final js = [{
      'id': "6757265",
      'procedencia':1,
      'details':["x2 burgers", "x3 asdsa","x5 saklda"],
      'price':'663',
      'timeArrive':'5:00',
      'deliveryDate':'08/07/2018'
    },
    {
      'id': "342480",
      'procedencia':2,
      'details':["x1 burgers","x2 8saduashda"],
      'price':'9845',
      'timeArrive':'13:21',
      'deliveryDate':'09/05/2018'
    }];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    // Obitene el tamaño actual de la pantalla.
    final Size screenSize = MediaQuery.of(context).size;

    // Crea la vista.
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new SideBar(),
      appBar: new AppBar(
        leading:  new IconButton(
          icon: new Icon(Icons.dehaze), 
          color: iconsAppbarColor,
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),// Nombre mostrado en la vista.
        title: const Text('Pedidos anteriores', style: titleStyle,),
      ),
      body:new SingleChildScrollView( // Cuerpo de la vista.
        controller: scrollController,
        child: new Container(
          child: new Column(
            children: js.map((prod){ // Itera por los pedidos y regresa una card formateada.
              int index = js.indexOf(prod);
              return new OrderCard(
                cardId: "id-"+prod['id'],
                onPressedOk: (){
                  setState((){
                    js.remove(prod);
                  });
                },
                onPressedAccept: (){
                  showInSnackBar("Rellene el campo primero");
                },
                onPressedDelete: (){
                  setState((){
                    js.remove(prod);
                  });
                },
                codeProcedencia: prod['procedencia'],
                details: prod['details'],
                price: prod['price'],
                timeArrive: prod['timeArrive'],
                previuos: true,
                deliveryDate: prod['deliveryDate'],
              );
            }).toList(),
          )
        ),
      )
    );
  }
}