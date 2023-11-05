import 'package:flutter/material.dart';

class CocktailInfo extends StatelessWidget {
  final Map<String, dynamic> cocktailData;
  CocktailInfo(this.cocktailData);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromRGBO(255, 253, 208, 1),
          appBar: AppBar(
            title: Text('Cocktail App'),
            foregroundColor: Color.fromRGBO(0, 0, 0, 1),
            backgroundColor: Color.fromRGBO(255, 253, 208, 1),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Center(
              child: Column(children: [
            Center(child: Text("${cocktailData["strDrink"]} information!")),
            Center(child: Text("Hello to page 2 ${cocktailData["strDrink"]}")),
          ]))),
    );
  }
}
