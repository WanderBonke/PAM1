// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: num1Controller,
                decoration: const InputDecoration(
                  labelText: "Primeiro número",
                ),
              ),
              TextField(
                controller: num2Controller,
                decoration: const InputDecoration(
                  labelText: "Segundo número",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => soma(context),
                      child: Column(children: const [Text("+")]
                      )
                    ),
              ElevatedButton(
                  onPressed: () => subtrair(context),
                  child: Column(children: const [Text("-")]
                  )
                ),
              ElevatedButton(
                  onPressed: () => multiplicar(context),
                  child: Column(children: const [Text("*")])),
              ElevatedButton(
                  onPressed: () => dividir(context),
                  child: Column(children: const [Text("/")])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void soma(BuildContext context) {
    final num1 = double.parse(num1Controller.text);
    final num2 = double.parse(num2Controller.text);

    final snackBar = SnackBar(
      content: Text("$num1 + $num2 = ${num1 + num2}"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void subtrair(BuildContext context) {
    final num1 = double.parse(num1Controller.text);
    final num2 = double.parse(num2Controller.text);

    final snackBar = SnackBar(
      content: Text("$num1 - $num2 = ${num1 - num2}"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void multiplicar(BuildContext context) {
    final num1 = double.parse(num1Controller.text);
    final num2 = double.parse(num2Controller.text);

    final snackBar = SnackBar(
      content: Text("$num1 * $num2 = ${num1 * num2}"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void dividir(BuildContext context) {
    final num1 = double.parse(num1Controller.text);
    final num2 = double.parse(num2Controller.text);

    if (num2 == 0) {
      const snackBar = SnackBar(content: Text("Não existe divisão igual a 0"),);

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }


    final snackBar = SnackBar(
      content: Text("$num1 / $num2 = ${num1 / num2}"),
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Atividade",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: HomePage(),
    );
  }
}

void main() => runApp(const Aplicacao());
