import 'package:flutter/material.dart';
import 'package:rest_bar/screens/Home/style.dart';


class OrderCard extends StatelessWidget {
  String cardId, procedencia, price, timeArrive;
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
  });
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    if(codeProcedencia == 1){
      procedencia = "Facebook";
      textProcedenciaStyle = new TextStyle(color: Colors.cyan);
    }
    else if(codeProcedencia == 2){
      procedencia = "Google";
      textProcedenciaStyle = new TextStyle(color: Colors.orange);
    }
    else if(codeProcedencia == 3){
      procedencia = "Pagado";
      textProcedenciaStyle = new TextStyle(color: Colors.green);
    }
    else{
      procedencia = "Sin referencia";
      textProcedenciaStyle = new TextStyle(color: Colors.red);
    }
    return ( new Card(
        elevation: 5.0,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.fastfood),
              title: new Text(cardId),
              subtitle: new Text(
                procedencia, 
                style: textProcedenciaStyle,
              ),
              trailing: new RaisedButton(
                child: const Text(
                  'Entregado', 
                  style: const TextStyle(color: Colors.cyan),
                ),
                onPressed: onPressedOk,
              ),
            ),
            _buildRows(),
            new Divider(),
            new ListTile(
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
