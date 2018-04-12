import 'package:flutter/material.dart';
import 'package:rest_bar/components/Sidebar/index.dart';
import "package:rest_bar/components/Cards/productAdminCard.dart";
import 'style.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Products extends StatefulWidget{
  const Products({Key key}) : super(key : key);
  @override
  ProductsState createState() => new ProductsState();
}

class ProductsState extends State<Products>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();
  TextEditingController controller = new TextEditingController(text: "");
  TextEditingController editController = new TextEditingController(text: "");
  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
  final cards = [{
      'title':'Hawaiana',
      'subtitle':'Lorem ipsum dolor sit amet',
      'price':'657',
      'img':pizzaImg3,
    },
    {
      'title':'Ranchera',
      'subtitle':'Lorem ipsum dolor sit amet',
      'price':'209',
    },
    {
      'title':'Mexicana',
      'subtitle':'Lorem ipsum dolor sit amet',
      'price':'277',
    }];
  final sucursales = ['uhs', 'kjh', '34e'];
  final categorias = ['Hamburguesas', 'Especiales', 'Postres', 'Tamarindos'];
  @override
  Widget build(BuildContext context){
    final TextEditingController _controllerA = new TextEditingController();
    final TextEditingController _controllerB = new TextEditingController();
    final Size screenSize = MediaQuery.of(context).size;
    List itemsDropdown = categorias.map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(value),
            new IconButton(
              onPressed: (){
                _showDialogEdit(
                  'Editar categoria', 
                  'Editar', 
                  'Eliminar',
                  'Cancelar', 
                  (){
                    setState((){});
                    Navigator.pop(context);
                  }, 
                  (){
                    Navigator.pop(context);
                  }, 
                  (){
                    Navigator.pop(context);
                  }, 
                  new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                      labelText: 'Nombre de la categoria',
                    ),
                  ),
                );
              },
              icon: new Icon(Icons.edit),
            )
          ],
        ),
      );
    }).toList();
    itemsDropdown.add(new DropdownMenuItem<String>(
        value: 'Agregar',
        child: new Center(
          child: new IconButton(
            icon: new Icon(Icons.add),
            onPressed: (){
              _showDialog(
                'Agrega una categoria', 
                'Agregar', 
                'Cancelar', 
                (){
                  setState((){
                    categorias.add(controller.text);
                  });
                  Navigator.pop(context);
                }, 
                (){
                  Navigator.pop(context);
                }, 
                new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                    labelText: 'Nombre de la categoria',
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
    List itemsSucursales = sucursales.map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(value),
            new IconButton(
              onPressed: (){
                _showDialogEdit(
                  'Editar sucursal', 
                  'Editar', 
                  'Eliminar',
                  'Cancelar', 
                  (){
                    Navigator.pop(context);
                  }, 
                  (){
                    Navigator.pop(context);
                  }, 
                  (){
                    Navigator.pop(context);
                  }, 
                  new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                        title: new TextField(
                          decoration: new InputDecoration(
                            hintText: 'Nombre',
                            hintStyle: new TextStyle(color: Colors.black),
                          ),
                          controller: _controllerA,
                        ),
                      ),
                      new Divider(),
                      new ListTile(
                        title: new TextField(
                          decoration: new InputDecoration(
                            hintText: 'Dirección',
                            hintStyle: new TextStyle(color: Colors.black),
                            
                          ),
                          controller: _controllerB,
                        ),
                      ),
                      new Container(
                        height: (screenSize.height)/2.2,
                        child: new FlutterMap(
                          options: new MapOptions(
                            center: new LatLng(19.4300834, -99.1645669),
                            zoom: 19.33,
                          ),
                          layers: [
                            new TileLayerOptions(
                              urlTemplate: "https://api.tiles.mapbox.com/v4/"
                                  "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                              additionalOptions: {
                                'accessToken': 'pk.eyJ1IjoiZWx6b21iaWVpc3JhIiwiYSI6ImNqZmlrYWM5eTBkZ3kzM29lbW13MHEwY3QifQ.jGBvPRMnPHyBk3IosGmbkg',
                                'id': 'mapbox.streets',
                              },
                            ),
                            new MarkerLayerOptions(
                              markers: [
                                new Marker(
                                  width: 30.0,
                                  height: 30.0,
                                  point: new LatLng(19.4300834, -99.1645669),
                                  builder: (ctx) =>
                                  new Container(
                                    child: new FlutterLogo(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                );
              },
              icon: new Icon(Icons.edit),
            )
          ],
        ),
      );
    }).toList();
    itemsSucursales.add(new DropdownMenuItem<String>(
        value: 'Agregar',
        child: new Center(
          child: new IconButton(
            icon: new Icon(Icons.add),
            onPressed: (){
              _showDialog(
                'Agrega una sucursal', 
                'Agregar', 
                'Cancelar', 
                (){
                  Navigator.pop(context);
                }, 
                (){
                  Navigator.pop(context);
                }, 
                new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: 'Nombre',
                          hintStyle: new TextStyle(color: Colors.black),
                        ),
                        controller: _controllerA,
                      ),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: 'Dirección',
                          hintStyle: new TextStyle(color: Colors.black),
                        ),
                        controller: _controllerB,
                      ),
                    ),
                    new Container(
                      height: (screenSize.height)/2.2,
                      child: new FlutterMap(
                        options: new MapOptions(
                          center: new LatLng(19.4300834, -99.1645669),
                          zoom: 19.33,
                        ),
                        layers: [
                          new TileLayerOptions(
                            urlTemplate: "https://api.tiles.mapbox.com/v4/"
                                "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                            additionalOptions: {
                              'accessToken': 'pk.eyJ1IjoiZWx6b21iaWVpc3JhIiwiYSI6ImNqZmlrYWM5eTBkZ3kzM29lbW13MHEwY3QifQ.jGBvPRMnPHyBk3IosGmbkg',
                              'id': 'mapbox.streets',
                            },
                          ),
                          new MarkerLayerOptions(
                            markers: [
                              new Marker(
                                width: 30.0,
                                height: 30.0,
                                point: new LatLng(19.4300834, -99.1645669),
                                builder: (ctx) =>
                                new Container(
                                  child: new FlutterLogo(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              );
            }
          ),
        ),
      ),
    );
    return new Scaffold(
      drawer: new SideBar(),
      appBar: new AppBar(
        title: const Text('Productos'),
      ),
      body: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new DropdownButton(
                hint: new Text(
                  "Sucursales",
                  style: new TextStyle(color: Colors.black),
                ),
                items: itemsSucursales,
                onChanged: (_){},
              ),
              new DropdownButton(
                hint: new Text(
                  'Categorías',
                  style: new TextStyle(color: Colors.black),
                ),
                onChanged: (_){},
                items: itemsDropdown,
              ),
            ],
          ),
          new Container( 
            height: screenSize.height/10,
            width: screenSize.width/5*3,
            child: new Center(
              child: new RaisedButton(
                onPressed: (){
                  _showDialog('Agrega un producto', 
                    'Agregar', 
                    'Cancelar', 
                    (){
                      Navigator.pop(context);
                    }, 
                    (){
                      Navigator.pop(context);
                    }, 
                    new Container(
                      child: new SingleChildScrollView(
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new ListTile(
                              title: new TextField(
                                decoration: new InputDecoration(
                                  hintText: 'Nombre',
                                  hintStyle: new TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            new ListTile(
                              title: new TextField(
                                decoration: new InputDecoration(
                                  hintText: 'Descripción',
                                  hintStyle: new TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            new ListTile(
                              title: new TextField(
                                decoration: new InputDecoration(
                                  hintText: 'Precio',
                                  hintStyle: new TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            new ListTile(
                              title: const Text('Foto'),
                              trailing: new IconButton(
                                onPressed: (){},
                                icon: new Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Icon(Icons.add),
                    const Text('Agregar un producto'),
                  ],
                ),
              ),
            )
          ),
          new Container(
            height: (screenSize.height/3)*2+15,
            child: new SingleChildScrollView(
              padding: new EdgeInsets.all(5.0),
              child: new Column(
                children: cards.map((prod){
                  int index = cards.indexOf(prod);
                  return new ProductAdminCard(
                    title: prod['title'],
                    subtitle: prod['subtitle'],
                    price: prod['price'],
                    img: prod['img'],
                    onPressedDelete: (){
                      _showAlert(
                        context, 
                        'Alerta', 
                        '¿Estás seguro que queires borrar este producto?', 
                        'Borrar', 
                        'Regresar', 
                        (){
                          setState((){
                            cards.removeAt(index);
                          });
                          Navigator.pop(context);
                        }, 
                        (){
                          Navigator.pop(context);
                        }
                      );
                    },
                    onPressedEdit: (){
                      _showDialogEdit('Agrega un producto', 
                        'Agregar', 
                        'Eliminar',
                        'Cancelar', 
                        (){
                          Navigator.pop(context);
                        }, 
                        (){
                          Navigator.pop(context);
                        }, 
                        (){
                          Navigator.pop(context);
                        }, 
                        new Container(
                          child: new SingleChildScrollView(
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new ListTile(
                                  title: new TextField(
                                    decoration: new InputDecoration(
                                      hintText: 'Nombre',
                                      hintStyle: new TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                new ListTile(
                                  title: new TextField(
                                    decoration: new InputDecoration(
                                      hintText: 'Descripción',
                                      hintStyle: new TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                new ListTile(
                                  title: new TextField(
                                    decoration: new InputDecoration(
                                      hintText: 'Precio',
                                      hintStyle: new TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                new ListTile(
                                  title: const Text('Foto'),
                                  trailing: new IconButton(
                                    onPressed: (){},
                                    icon: new Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
  _showAlert(BuildContext context, title, description, titleAccept, titleError, accept, error) async {
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
  _showDialog(String title, String actionTitle1, String actionTitle2, action1, action2, Widget child) async {
    await showDialog<String>(
      context: context,
      child: new SystemPadding(
        child: new AlertDialog(
          title: new Text(title),
          contentPadding: const EdgeInsets.all(16.0),
          content: child,
          actions: <Widget>[
            new FlatButton(
              child: new Text(actionTitle1),
              onPressed: action1,
            ),
            new FlatButton(
              child: new Text(actionTitle2),
              onPressed: action2,
            ),
          ],
        ),
      ),
    );
  }
  _showDialogEdit(String title, String actionTitle1, String actionTitle2, String actionTitle3, action1, action2, action3, Widget child) async {
    await showDialog<String>(
      context: context,
      child: new SystemPadding(
        child: new AlertDialog(
          title: new Text(title),
          contentPadding: const EdgeInsets.all(16.0),
          content: child,
          actions: <Widget>[
            new FlatButton(
              child: new Text(actionTitle1),
              onPressed: action1,
            ),
            new FlatButton(
              child: new Text(actionTitle2),
              onPressed: action2,
            ),
            new FlatButton(
              child: new Text(actionTitle3),
              onPressed: action3,
            ),
          ],
        ),
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