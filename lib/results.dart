
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ResultPage extends StatelessWidget {
  final int score;

  const ResultPage({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     int questions = 30;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brain Smash"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Brain Smashed! Correct Answers $score out of $questions questions.",
              style: const TextStyle(fontSize: 25, color: Colors.yellowAccent,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text("Play Again"),
              onPressed: () {

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => QuizApp(),

                  ),
                );

              },
            ),
            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
