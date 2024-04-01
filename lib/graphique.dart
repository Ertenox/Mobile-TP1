import 'package:flutter/material.dart';
import 'fonction.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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


  String _uniteDepart = "";
  String _uniteArrivee = "";
  double _nombreSaisi = 0.0;
  String? _message;
  fonction _fonction = fonction();


  @override
  void initState() {
    super.initState();
    _uniteDepart = _mesuresMap.keys.first;
    _uniteArrivee = _mesuresMap.keys.first;
    _nombreSaisi = _initialiserNombreSaisi();
  }

  double _initialiserNombreSaisi() {
    return 0.0;
  }

@override
Widget build(BuildContext context) {
  final TextStyle styleEntree = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );
  final TextStyle styleLabel = TextStyle(
    fontSize: 20,
    color: Colors.grey[700],
  );
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Convertisseur MENDY Auguste'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            children: [
              Text(
                'Valeur à convertir :',
                style: styleEntree,
              ),
              Spacer(),
              TextField(
                keyboardType: TextInputType.number,
                style: styleEntree,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Saisissez la mesure à convertir',
                ),
                onChanged: (texte) {
                  var vr = double.tryParse(texte);
                  if (vr != null) {
                    setState(() {
                      _nombreSaisi = vr;
                    });
                  }
                },
              ),
              Spacer(),
              Text(
                'Valeur de _nombreSaisi : $_nombreSaisi',
              ),
              Spacer(),
              Text(
                "Depuis",
                style: styleLabel,
              ),
              Spacer(),
              DropdownButton<String>(
                value: _uniteDepart,
                items: _mesuresMap.keys.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _uniteDepart = value!;
                  });
                },
              ),
              Spacer(),
              Text(
                'Vers',
                style: styleLabel,
              ),
              Spacer(),
              DropdownButton<String>(
                value: _uniteArrivee,
                items: _mesuresMap.keys.map((String valueV) {
                  return DropdownMenuItem<String>(
                    value: valueV,
                    child: Text(valueV),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _uniteArrivee = value!;
                  });
                },
              ),Spacer(
                flex: 2,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_nombreSaisi == 0) {
                    return;
                  } else {
                    var resultat = _fonction.convertir(_nombreSaisi, _uniteDepart, _uniteArrivee, setState);
                    setState(() {
                      _message = resultat;
                    });
                  }
                },
                child: Text(
                  'Convertir',
                  style: styleEntree,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                _nombreSaisi.toString(),
                style: styleLabel,
              ),
              Spacer(
                flex: 8,
              ),
              Text(
                _message ?? '',
                textAlign: TextAlign.center,
                style: styleLabel,
              ),
            ]
        ),
      ),
    ),
  );
}
}