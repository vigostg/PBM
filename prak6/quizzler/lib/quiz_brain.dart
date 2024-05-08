import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Universitas Pancasila berada di Jakarta tepatnya pada Jakarta Selatan', questionAnswer: true),
    Question(questionText: 'ganjar pernah menjabat sebagai Gubernur DKI', questionAnswer: false),
    Question(questionText: 'Deddy Corbuzier pernah menjadi politisi di Indonesia', questionAnswer: false),
    Question(questionText: 'Bahasa Betawi adalah bahasa yang unik dan sangat kental pada daerah Jakarta', questionAnswer: true),
    Question(questionText: 'Gitar merupakan salah satu alat Musik yang sangat asik digunakan', questionAnswer: true),
    Question(questionText: 'Univ Pancasila dikenal sebagai kampus negeri', questionAnswer: false),
    Question(questionText: 'Univ Pancasila Mempunyai stasiun dan halte', questionAnswer: true),
    Question(questionText: 'Teknik Informatika merupakan Jurusan yang sangat asik dan menyenangkan', questionAnswer: false),
    Question(questionText: 'Mas Vigo sangat handal dalam bernyanyi dan mempunyai suara yang sangat merdu', questionAnswer: true),
    Question(questionText: 'Univ Pancasila mempunyai kampus lain di Bandung', questionAnswer: false),
    Question(questionText: 'Mahasiswa Teknik Informatika sangat menyukai Coding', questionAnswer:  true),
    Question(questionText: 'Mas Vigo sangat menyukai semua dosen di Teknik Informatika', questionAnswer: true),
    Question(questionText: 'Univ Pancasila merupakan kampus yang panas', questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - create isFinished method that checks the last questions.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1 ) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length;
  }
  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}