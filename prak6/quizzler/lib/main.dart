import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// membuat object quizBrain
QuizBrain quizBrain = QuizBrain();

// main Method
void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplikasi Kuis'),
          backgroundColor: Color.fromARGB(255, 6, 245, 34),
        ),
        backgroundColor: Color.fromARGB(255, 6, 245, 34),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // array/list untuk menyimpan score, berupa Icon check or close.
  List<Icon> scoreKeeper = [];

  // menghitung jawaban benar dan salah
  int numCorrect = 0;
  int numIncorrect = 0;

  // fungsi mengecek jawaban dari user (parameter userPickedAnswer)
  // ke jawaban dari daftar pertanyaan (list questions/_questionBanks)
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    // setState
    setState(() {
      //TODO: Step 4 - menggunakan IF/ELSE untuk cek akhir quiz
      //jika ia, maka ke line berikuntya
      if (quizBrain.isFinished() == true ) {
        //TODO Step 4 Part A - menampilkan alert menggunakan rFlutter_alert
        Alert(
          context: context,
          title: 'Selesai',
          desc: 'Kamu Telah Menyelesaikan Kuis\n'
          'Jawaban Benar: $numCorrect\n'
          'Jawaban Salah: $numIncorrect\n'
          'Total Pertanyaan: ${quizBrain.getTotalQuestions()}',
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
      }

      //TODO: Step 6 - if not reached the end, ELSE do the answer checking
      else {
       // Ganti ikon centang dengan ikon senyum
if (userPickedAnswer == correctAnswer) {
  scoreKeeper.add(const Icon(
    Icons.sentiment_satisfied,
    color: Colors.blue,
  ));
  numCorrect++;
}
// Ganti ikon silang dengan ikon sedih
else {
  scoreKeeper.add(const Icon(
    Icons.sentiment_dissatisfied,
    color: Colors.red,
  ));
  numIncorrect++;
}
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  )
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.pink),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "TRUE",
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "FALSE",
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}