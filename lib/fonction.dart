import 'package:flutter/material.dart';

class fonction {
  final dynamic _formules = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1 , 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280 , 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 0, 0, 0.0625, 1 ],
  };

  String convertir(double valeur, String depuis, String vers, setState) {
    final Map<String, int> _mesuresMap = {
      'mètres': 0,
      'kilomètres': 1,
      'grammes': 2,
      'kilogrammes': 3,
      'pieds': 4,
      'miles': 5,
      'livres': 6,
      'onces': 7
    };

    int numDepuis = _mesuresMap[depuis] ?? 0;
    int numVers = _mesuresMap[vers] ?? 0;
    var multiplicateur = _formules[numDepuis.toString()][numVers];
    var resultat = valeur * multiplicateur;
    var message;
    if (resultat == 0) {
      message = 'Cette conversion ne peut être réalisée!!!';
    } else {
      message =
      '${valeur.toString()} $depuis\n est égal à\n${resultat.toString()} $vers';
    }
    return message;
  }
}