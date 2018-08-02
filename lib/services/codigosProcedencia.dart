import 'package:flutter/material.dart';

class CodigosProcedencia{

  // Recibe un int que es el codigo de procedencia de un pedido y regresa
  // un String con el nombre de la procedencia y un TextStyle con el estilo del texto
  List codigo(int codeProcedencia){
    String procedencia;
    TextStyle textProcedenciaStyle;
    List datos = new List(2);
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
    datos[0] = procedencia;
    datos[1] = textProcedenciaStyle;

    return datos;
  }
}