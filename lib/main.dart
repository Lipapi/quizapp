import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizapp/results.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
          color: Colors.blueGrey,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> questions = [
    "What is the capital of France?",
    "What is the largest ocean in the world?",
    "What is the tallest mountain in the world?",
    "What is the capital of Japan?",
    "What is the currency used in Spain?",
    "What is the capital of Australia?",
    "What is the capital of Germany?",
    "What is the largest country in the world?",
    "What is the smallest country in the world?",
    "What is the capital of United States?",
    "What is the currency used in China?",
    "What is the largest desert in the world?",
    "What is the longest river in the world?",
    "What is the capital of Brazil?",
    "What is the capital of Russia?",
    "What is the currency used in France?",
    "What is the capital of Canada?",
    "What is the currency used in India?",
    "What is the capital of South Africa?",
    "What is the capital of Italy?",
    "What is the currency used in Japan?",
    "What is the largest lake in the world?",
    "What is the capital of England?",
    "What is the currency used in Australia?",
    "What is the capital of Mexico?",
    "What is the currency used in Brazil?",
    "What is the capital of Turkey?",
    "What is the currency used in Russia?",
    "What is the capital of Argentina?"
  ];

  List<String> answers = [
    "Paris",
    "Pacific Ocean",
    "Mount Everest",
    "Tokyo",
    "Euro",
    "Canberra",
    "Berlin",
    "Russia",
    "Vatican City",
    "Washington D.C.",
    "Renminbi (Yuan)",
    "Sahara Desert",
    "Nile",
    "Brasília",
    "Moscow",
    "Euro",
    "Ottawa",
    "Indian Rupee",
    "Pretoria (Tshwane)",
    "Rome",
    "Japanese Yen",
    "Caspian Sea",
    "London",
    "Australian Dollar",
    "Mexico City",
    "Brazilian Real",
    "Ankara",
    "Russian Ruble",
    "Buenos Aires"
  ];
  List<String> options = [
    "Paris, Marseille, Lyon",
    "Atlantic Ocean, Indian Ocean, Pacific Ocean",
    "Mount Everest, K2, Annapurna",
    "Tokyo, Osaka, Kyoto",
    "Euro, Peso, Dollar",
    "Canberra, Melbourne, Sydney",
    "Berlin, Hamburg, Munich",
    "Russia, Canada, China",
    "Vatican City, Monaco, San Marino",
    "Washington D.C., New York, Los Angeles",
    "Renminbi (Yuan), Hong Kong Dollar, Taiwan Dollar",
    "Sahara Desert, Arabian Desert, Kalahari Desert",
    "Nile, Amazon, Yangtze",
    "Brasília, São Paulo, Rio de Janeiro",
    "Moscow, St. Petersburg, Novosibirsk",
    "Euro, Pound, Franc",
    "Ottawa, Toronto, Vancouver",
    "Indian Rupee, Pakistani Rupee, Nepalese Rupee",
    "Pretoria (Tshwane), Johannesburg, Cape Town",
    "Rome, Milan, Venice",
    "Japanese Yen, Korean Won, Chinese Yuan",
    "Caspian Sea, Lake Superior, Lake Victoria",
    "London, Manchester, Liverpool",
    "Australian Dollar, New Zealand Dollar, Fiji Dollar",
    "Mexico City, Guadalajara, Monterrey",
    "Brazilian Real, Chilean Peso, Argentine Peso",
    "Ankara, Istanbul, Izmir",
    "Russian Ruble, Belarusian Ruble, Kazakhstani Tenge",
    "Buenos Aires, Santiago, Rio de Janeiro"
  ];


  void shuffleList(List list) {
    var random = new Random();
    for (var i = list.length - 1; i > 0; i--) {
      var j = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }


  }

  int currentIndex = 0;
  int score = 0;
  int incorrectAnswers = 0;


  @override
  Widget build(BuildContext context) {
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
            Align(
              alignment: Alignment.center,
              child: Text(
                questions[currentIndex],
                style: const TextStyle(fontSize: 20,color: Colors.yellowAccent,fontWeight: FontWeight.bold),
              ),),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text(options[currentIndex].split(',')[0]),
              onPressed: () {
                shuffleList(questions);
                shuffleList(answers);
                shuffleList(options);
                setState(() {
                  if (options[currentIndex].split(',')[0].contains(answers[currentIndex])) {
                    score++;
                  }
                  if (currentIndex < questions.length - 1) {
                    currentIndex++;
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(score: score),
                      ),
                    );
                  }
                });
              },
            ),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text(options[currentIndex].split(',')[1]),
              onPressed: () {
                setState(() {
                  if (!options[currentIndex].split(',')[1].contains(answers[currentIndex])) {
                    incorrectAnswers++;
                  }
                  if (incorrectAnswers == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(score: score),
                      ),
                    );
                  }
                  if (options[currentIndex].split(',')[1].contains(answers[currentIndex])) {
                    score++;
                  }
                  if (currentIndex < questions.length - 1) {
                    currentIndex++;
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(score: score),
                      ),
                    );
                  }
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text(options[currentIndex].split(',')[2]),
              onPressed: () {
                setState(() {
                  if (options[currentIndex].split(',')[2].contains(answers[currentIndex])) {
                    score++;
                  }
                  if (currentIndex < questions.length - 1) {
                    currentIndex++;
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(score: score),
                      ),
                    );
                  }
                });
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
