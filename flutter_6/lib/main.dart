import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class Task extends StatelessWidget {
  final String texto;
  final String imagem;
  final double rating;
  const Task(
      {super.key,
      required this.texto,
      required this.imagem,
      required this.rating});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.white,
                  width: 100,
                  height: 130,
                  child: Image.asset(
                    'assets/images/$imagem',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 220,
                  height: 130,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      texto,
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(texto),
                        duration: const Duration(seconds: 1),
                      ));
                    },
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightGreenAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(0))),
                    child: const Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: Colors.lightGreenAccent,
              height: 50,
              width: 400,
              child: RatingBar.builder(
                ignoreGestures: true,
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.redAccent,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Músicas!",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: ListView(
          children: const [
            Task(
              texto: "Blurryface",
              imagem: 'blurry.png',
              rating: 5,
            ),
            Task(
              texto: "Favorite Worst Nightmare",
              imagem: 'FavWortsNightmare.png',
              rating: 4.5,
            ),
            Task(
              texto: "Heroes & Villains",
              imagem: 'HerosVillains.png',
              rating: 4,
            ),
            Task(
              texto: "Swimming",
              imagem: 'Swimming.png',
              rating: 5,
            ),
            Task(
              texto: "This Is Why ",
              imagem: 'ThisIsWhy.png',
              rating: 5,
            ),
          ],
        ),
      ),
    );
  }
}
