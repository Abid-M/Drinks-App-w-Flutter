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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Information on '${cocktailData["strDrink"]}'",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Text(
                "Additional text goes here.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
