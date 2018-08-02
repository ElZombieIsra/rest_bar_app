import 'package:flutter/material.dart';

class CrearAlerta{
  
  showAlert(BuildContext context, title, description, titleAccept, titleError, accept, error) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        title: new Text(title),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text(description),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text(titleError),
            onPressed: error,
          ),
          new FlatButton(
            child: new Text(titleAccept),
            onPressed: accept,
          ),
        ],
      ),
    ); 
  }
}

class SystemPadding extends StatelessWidget {
  final Widget child;

  SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
      padding: mediaQuery.viewInsets,
      duration: const Duration(milliseconds: 300),
      child: child
    );
  }
}