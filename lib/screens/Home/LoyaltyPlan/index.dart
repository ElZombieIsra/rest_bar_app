import 'package:flutter/material.dart';
import 'package:rest_bar/components/Sidebar/index.dart';
import 'package:rest_bar/theme/style.dart';

class LoyaltyPlan extends StatefulWidget{
  const LoyaltyPlan({Key key}): super(key : key);

  @override
  LoyaltyPlanState createState() => new LoyaltyPlanState();
}

class LoyaltyPlanState extends State<LoyaltyPlan>{
  final user = [{
    'name':'Raul Cortés',
    'phone':'5565606760',
    'mail':'raul.epsidev@gmail.com',
    'qr':'assets/perfil.png',
  }];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ExactAssetImage qr = new ExactAssetImage('assets/qr_img.png');
  Widget build(BuildContext context){
    final usuario = user[0];
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
        title: const Text('Cuenta', style: titleStyle,),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              child: new Center(
                child: new Image(
                  image: new ExactAssetImage(usuario['qr']),
                ),
              ),
            ),
            new Container(height: 10.0,),
            new Text(
              usuario['name'],
              style: new TextStyle(fontSize: 24.0),
            ),
            new Container(height: 6.0,),
            new Text(usuario['phone']),
            new Container(height: 6.0,),
            new Text(usuario['mail']),
            new Container(height: 10.0,),
            new Center(
              child: new Column(
                children: <Widget>[
                  new Text(
                    'Plan de lealtad',
                    style: new TextStyle(fontSize: 24.0),
                  ),
                  new Image(image: qr,)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}