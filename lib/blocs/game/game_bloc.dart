import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:find_word/data/models/question_model.dart';
import 'package:find_word/data/repositories/game_repository.dart';
import 'package:find_word/screens/result_screen.dart';
import 'package:find_word/services/service_locator.dart';
import 'package:find_word/screens/win_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(
          const GameState(
            allQuestions: [],
            currentQuestionIndex: 0,
            trueCount: 0,
            lettersList: [],
            enteredAnswer: "",
          ),
        ) {
    on<LoadQuestions>(onInit);
    on<NextQuestions>(onNext);
    on<CollectEnteredLetter>(onCollect);
    on<ClearSelectedLetterEvent>(clearLetter);
    on<RestartGameEvent>(restartGame);
  }

  onInit(LoadQuestions event, emit) {
    List<QuestionModel> questions = locator.get<GameRepository>().questions;
    String answerText = questions[state.currentQuestionIndex].answer.toUpperCase();

    emit(
      state.copyWith(
        allQuestions: questions,
        lettersList: getOptionLetters(answerText.toUpperCase()),
      ),
    );
  }

  onNext(NextQuestions event, emit) {
    if (state.enteredAnswer.toLowerCase() ==
        state.allQuestions[state.currentQuestionIndex].answer.toLowerCase()) {
      if (state.allQuestions.length - 1 >= state.currentQuestionIndex + 1) {
        int newQuestionIndex = state.currentQuestionIndex + 1;
        Navigator.push(
          event.context,
          MaterialPageRoute(builder: (context) => WinScreen()), // Changed line
        );

        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(content: Text("To'g'ri topdingiz"), backgroundColor: Colors.greenAccent,),
        );
        emit(
          state.copyWith(
            lettersList: getOptionLetters(state.allQuestions[newQuestionIndex].answer),
            trueCount: state.trueCount + 1,
            currentQuestionIndex: newQuestionIndex,
            enteredAnswer: "",
          ),
        );
      }
      else {
        Navigator.push(
          event.context,
          MaterialPageRoute(builder: (context) => ResultScreen()), // Changed line
        );
      }

      }
    else {
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(content: Text("Noto'g'ri javob"), backgroundColor: Colors.red,),
      );
    }

  }



  onCollect(CollectEnteredLetter event, emit) {
    if (state.allQuestions[state.currentQuestionIndex].answer.length >
        state.enteredAnswer.length) {
      emit(state.copyWith(enteredAnswer: state.enteredAnswer + event.letter));
    }
  }

  clearLetter(ClearSelectedLetterEvent event, emit) {
         final newEnteredAnswer = state.enteredAnswer.substring(0, event.index) +
          state.enteredAnswer.substring(event.index + 1);
      emit(state.copyWith(enteredAnswer: newEnteredAnswer));

  }

  restartGame(RestartGameEvent event, emit) {
    emit(state.copyWith(currentQuestionIndex: 0, trueCount: 0, enteredAnswer: ""));

  }

}

String alphabet = "qwertyuiopasdfghjklzxcvbnm";

List<String> getOptionLetters(String answerText) {
  int len = answerText.length;

  for (int i = 0; i < (12 - len); i++) {
    Random random = Random();
    int index = random.nextInt(26);
    answerText += alphabet[index];
  }
  List<String> letterList = answerText.split('');
  letterList.shuffle();
  debugPrint("LENGTH:${letterList.length}:$letterList");
  return letterList;
}
