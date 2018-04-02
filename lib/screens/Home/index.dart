import "package:flutter/material.dart";
import "package:rest_bar/components/Cards/orderCard.dart";
import 'package:rest_bar/components/SideBar/index.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({ Key key }) : super(key: key);

@override
HomeScreenState createState() => new HomeScreenState();

}

class HomeScreenState extends State<HomeScreen>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();
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
      drawer: new SideBar(),
      appBar: new AppBar(
        title: const Text('Pedidos'),
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
              );
            }).toList(),
          )
        ),
      )
    );
  }
}