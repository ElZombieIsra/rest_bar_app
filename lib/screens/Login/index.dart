import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rest_bar/theme/style.dart';
import 'style.dart';
import 'package:rest_bar/components/TextFields/inputField.dart';
import 'package:rest_bar/components/Buttons/textButton.dart';
import 'package:rest_bar/components/Buttons/roundedButton.dart';
import 'package:rest_bar/services/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  BuildContext context;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();
  bool autovalidate = false;
  Validations validations = new Validations();

  _onPressed() {
    print("button clicked");
  }

  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void _handleSubmitted() {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; 
      showInSnackBar('Complete correctamente los campos en rojo');
    } else {
      form.save();
      Navigator.pushNamed(context, "/HomePage");
    }
  }
  void _pushUser() {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; 
      showInSnackBar('Complete correctamente los campos en rojo');
    } else {
      form.save();
      Navigator.pushNamed(context, "/HomePageUser");
    }
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    Validations validations = new Validations();
    return new Scaffold(
        key: _scaffoldKey,
        body: new SingleChildScrollView(
            controller: scrollController,
            child: new Container(
              padding: new EdgeInsets.all(16.0),
              decoration: new BoxDecoration(image: backgroundImage),
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: (screenSize.height / 5)*2,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Center(
                          child: new Image(
                            image: logo,
                            width: (screenSize.width < 500) ? 120.0 : (screenSize.width / 4) + 12.0,
                            height: screenSize.height / 4 + 20,
                          )
                        )
                      ]
                    )
                  ),
                  new Container(
                    height: (screenSize.height / 5)*3,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Form(
                          key: formKey,
                          autovalidate: autovalidate,
                          child: new Column(
                            children: <Widget>[
                              new InputField(
                                  hintText: "Correo",
                                  obscureText: false,
                                  textInputType: TextInputType.emailAddress,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  icon: Icons.mail_outline,
                                  iconColor: Colors.white,
                                  bottomMargin: 20.0,
                                  validateFunction: validations.validateEmail,
                                  ),
                              new InputField(
                                  hintText: "Contraseña",
                                  obscureText: true,
                                  textInputType: TextInputType.text,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  icon: Icons.lock_open,
                                  iconColor: Colors.white,
                                  bottomMargin: 30.0,
                                  validateFunction:
                                      validations.validatePassword,
                                  ),
                              new RoundedButton(
                                buttonName: "Iniciar sesión admin",
                                onTap: _handleSubmitted,
                                width: screenSize.width/2,
                                height: 40.0,
                                bottomMargin: 10.0,
                                borderWidth: 0.0,
                                buttonColor: primaryColor,
                              ),
                              new RoundedButton(
                                buttonName: "Iniciar sesión user",
                                onTap: _pushUser,
                                width: screenSize.width/2,
                                height: 40.0,
                                bottomMargin: 10.0,
                                borderWidth: 0.0,
                                buttonColor: primaryColor,
                              ),
                            ],
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new FloatingActionButton(
                              heroTag: "FB",
                              onPressed: (){
                                print("hola");
                              },
                              child: new Image(
                                image: fbLogo,
                              ),
                            ),
                            new FloatingActionButton(
                              heroTag: "google",
                              onPressed: (){
                                print("hola");
                              },
                              child: new Image(
                                image: gLogo,//fix google logo
                              ),
                            )
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new TextButton(
                                buttonName: "Olvidé mi contraseña",
                                onPressed: () => onPressed("/SignUp"),
                                buttonTextStyle: buttonTextStyle),
                            new TextButton(
                                buttonName: "Registrarme",
                                onPressed: _onPressed,
                                buttonTextStyle: buttonTextStyle)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
