import 'package:flutter/material.dart';
import 'package:rest_bar/screens/Home/style.dart';
import 'package:rest_bar/screens/Home/DetallePedido/detallePedido.dart';
import 'package:rest_bar/services/codigosProcedencia.dart';

// Crea una card con los datos recibidos
class OrderCard extends StatelessWidget {
  bool previuos = false;
  String cardId, procedencia, price, timeArrive, deliveryDate;
  int codeProcedencia, index;
  List<String> details;
  final VoidCallback onPressedOk, onPressedAccept, onPressedDelete;
  TextStyle textProcedenciaStyle,buttonTextStyle;
  OrderCard({
    this.cardId,
    this.onPressedOk,
    this.onPressedAccept,
    this.onPressedDelete,
    this.codeProcedencia,
    this.details,
    this.price,
    this.timeArrive,
    this.index,
    this.previuos,
    this.deliveryDate,
  });
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // Tamaño actual de la pantalla

    // Determina el código de procedencia del pedido y le asigna 
    CodigosProcedencia codigos = new CodigosProcedencia();
    List datosProcedencia = codigos.codigo(codeProcedencia);
    procedencia = datosProcedencia[0];
    textProcedenciaStyle = datosProcedencia[1];

    Text subtitle = new Text(
      procedencia, 
      style: textProcedenciaStyle,
    );
    // Crea un objeto del pedido
    var pedido = {
      'id': cardId,
      'name': 'Jon Doe',
      'number': 5523230000,
      'email': 'raul@epsidev.com',
      'details': details,
      'origin': subtitle,
      'paymentType': 1,
      'statusCode':1,
    };
    return ( 
      new Card(
        elevation: 5.0,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.fastfood),
              title: new FlatButton(
                child: new Text(cardId),
                onPressed: () => Navigator.push(
                  context, 
                  new MaterialPageRoute(
                    builder: (context) => new DetallePedido(pedido: pedido,),
                  ),
                ),
              ),
              subtitle: subtitle,
              trailing: !previuos 
                ? new RaisedButton(
                    child: const Text(
                      'Entregado', 
                      style: const TextStyle(color: Colors.cyan),
                    ),
                    onPressed: onPressedOk,
                  ) 
                : new Text(''),
            ),
            _buildRows(),
            new Divider(),
            // Si no es orden previa, envia el formulario. 
            // Si es previa, imprime la fecha de entrega
            !previuos 
            ? new ListTile(
                leading: new Text(timeArrive),
                title: new Form(
                  child: new TextFormField(
                    obscureText: true,
                    decoration: new InputDecoration(
                      hintText: "Tiempo estimado",
                      hintStyle: inputStyle,
                    ),
                  ),
                ),
                trailing: new ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(Icons.check),
                      color: Colors.green,
                      onPressed: onPressedAccept,
                    ),
                    new IconButton(
                      icon: new Icon(Icons.clear),
                      color: Colors.red,
                      onPressed: onPressedDelete,
                    ),
                  ],
                ),
              )
            : new ListTile(
                title: new Text(deliveryDate, style: new TextStyle(fontWeight: FontWeight.bold),),
              ),
          ],
        ),
      )
    );
  }
  Widget _buildRows (){
    ScrollController scrollController = new ScrollController();
    return new ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, i){
        if(i==details.length-1){
          return (
            new ListTile(
              title: new Text(details[i]),
              trailing: new Row(
                children: <Widget>[
                  new Icon(Icons.attach_money),
                  new Text(
                    price,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ), 
            )
          );
        }
        else{
          return (
            new ListTile(
              title: new Text(details[i]),
            )
          );
        }
        
      },
      itemCount: (details.length),
    );
  }
}
