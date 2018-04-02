import 'package:flutter/material.dart';


class SucursalesCard extends StatelessWidget {
  String nameSucursal, sucursalLocation;
  int index;
  final VoidCallback onPressedEdit, onPressedDelete;
  SucursalesCard({
    this.index,
    this.nameSucursal,
    this.onPressedEdit,
    this.onPressedDelete,
    this.sucursalLocation,
  });
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ( new Card(
        elevation: 5.0,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: new Text(nameSucursal),
              trailing: new Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.edit),
                    onPressed: onPressedEdit,
                  ),
                  new IconButton(
                    icon: new Icon(Icons.delete),
                    onPressed: onPressedDelete,
                  )
                ],
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text(sucursalLocation),
            ),
          ],
        ),
      )
    );
  }
}

