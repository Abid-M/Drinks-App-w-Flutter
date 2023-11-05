import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cocktail_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<dynamic>> fetchCocktails() async {
    var url = await http.get(
        Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/random.php"));
    return json.decode(url.body)["drinks"];
  }

  bool showCocktail = false; // No initial cocktail on load

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
        ),
        body:
            showCocktail // Use the boolean variable to conditionally show the cocktail
                ? FutureBuilder(
                    future: fetchCocktails(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }

                      if (snapshot.hasData) {
                        var cocktailData = snapshot.data[0];
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Welcome to the Cocktail App Generator!",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    showCocktail =
                                        true; // Show the cocktail when the button is pressed
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white)),
                                child: const Text("Generate a Cocktail"),
                              ),
                              Container(
                                height: 250,
                                child: Card(
                                  child: Image.network(
                                      cocktailData["strDrinkThumb"]),
                                ),
                              ),
                              Text(
                                cocktailData["strDrink"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Category: " + cocktailData["strCategory"]),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CocktailInfo(cocktailData)));
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black)),
                                child: const Text("Click for more info"),
                              ),
                            ],
                          ),
                        );
                      }

                      return Center(child: CircularProgressIndicator());
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome to the Cocktail App Generator!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showCocktail =
                                  true; // Show the cocktail when the button is pressed
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          child: const Text("Generate a Cocktail"),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

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
              //pops (go back the current page, opposite of push)
              Navigator.pop(context);
            },
          ),
        ),
        body:
            Center(child: Text("Hello to page 2 ${cocktailData["strDrink"]}")),
      ),
    );
  }
}
