import "package:flutter/material.dart";
import "package:rest_bar/components/Cards/orderCard.dart";
import 'package:rest_bar/components/SideBar/index.dart';
import 'package:rest_bar/services/crearAlerta.dart';
import 'package:rest_bar/theme/style.dart';
import 'style.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({ Key key }) : super(key: key);

@override
HomeScreenState createState() => new HomeScreenState();

}

class HomeScreenState extends State<HomeScreen>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();
  CrearAlerta alerta = new CrearAlerta();
  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
  final js = [{
      'id': "6757265",
      'procedencia':1,
      'details':["x2 burgers", "x3 asdsa","x5 saklda"],
      'price':'663',
      'timeArrive':'5:00'
    },
    {
      'id': "342480",
      'procedencia':2,
      'details':["x1 burgers","x2 8saduashda"],
      'price':'9845',
      'timeArrive':'13:21'
    }];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Se itera por la lista regresando las cards a una lista 
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
        title: const Text('Pedidos',
          style: titleStyle,
        ),
      ),
      body:new SingleChildScrollView(
        controller: scrollController,
        child: new Container(
          child: new Column(
            children: js.map((prod){
              int index = js.indexOf(prod);
              return new OrderCard(
                cardId: "id-"+prod['id'],
                onPressedOk: (){
                  alerta.showAlert(
                    context, 
                    'Atención', 
                    'Está por confirmar que el pedido ha sido entregado', 
                    'Confirmar', 
                    'Cancelar', 
                    (){
                      setState((){
                        js.remove(prod);
                      });
                      Navigator.pop(context);
                    },
                    (){
                      Navigator.pop(context);
                    }
                  );
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
                previuos: false,
              );
            }).toList(),
          )
        ),
      )
    );
  }
}

