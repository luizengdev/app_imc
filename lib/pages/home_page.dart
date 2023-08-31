import 'package:flutter/material.dart';

import '../blocs/imc.bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = ImcBloc();

  @override
  Widget build(BuildContext context) {
    const colorScheme1 = ColorScheme.light();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme1.primary,
          centerTitle: true,
          title: const Text('Calculadora de IMC'),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: bloc.heightCtrl,
                decoration: const InputDecoration(
                  labelText: 'Altura (cm)',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: bloc.weightCtrl,
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(bloc.result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme1.primary,
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      bloc.calculate();
                    });
                  },
                )),
          ],
        ));
  }
}
