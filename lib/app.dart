import 'package:quiz/question.dart';

class App {
  int _questionNumber = 0;
  List<question> _questionGroup = [
    question(
      q: 'Le nombre de planétes dans le systéme solaire est de huit ',
      i: 'images/image-1.jpg',
      a: true,
    ),
    question(
      q: 'Les chats sont des animaux carnivores',
      i: 'images/image-2.jpg',
      a: true,
    ),
    question(
      q: 'La chine est sur le continent africain ',
      i: 'images/image-3.jpg',
      a: false,
    ),
    question(
      q: 'La terre est plate ,pas sphérique',
      i: 'images/image-4.jpg',
      a: false,
    ),
    question(
      q: 'Humain peut vivre sans manger la viande ',
      i: 'images/image-5.jpg',
      a: true,
    ),
    question(
      q: 'La soleil tourne autour de la terre et la terre tourne autour de la lue  ',
      i: 'images/image-6.jpg',
      a: false,
    ),
    question(
      q: 'Les animaux ne ressentent pas la douleur ',
      i: 'images/image-7.jpg',
      a: false,
    ),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  bool getQuestionAnser() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  bool end() {
    if (_questionNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
