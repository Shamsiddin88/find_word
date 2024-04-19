
import 'package:find_word/data/models/question_model.dart';
import 'package:find_word/utils/images/app_images.dart';
import 'package:flutter/material.dart';

class GameRepository {
  GameRepository();

  List<QuestionModel> questions = [
   QuestionModel(answer: "milk", imageUrlFirst: AppImages.milk_1, imageUrlSecond: AppImages.milk_2, imageUrlThird: AppImages.milk_3, imageUrlFourth: AppImages.milk_4),
   QuestionModel(answer: "water", imageUrlFirst: AppImages.water_1, imageUrlSecond: AppImages.water_2, imageUrlThird: AppImages.water_3, imageUrlFourth: AppImages.water_4),
    QuestionModel(answer: "game", imageUrlFirst: AppImages.game_1, imageUrlSecond: AppImages.game_2, imageUrlThird: AppImages.game_3, imageUrlFourth: AppImages.game_4),
    QuestionModel(answer: "school", imageUrlFirst: AppImages.school_1, imageUrlSecond: AppImages.school_2, imageUrlThird: AppImages.school_3, imageUrlFourth: AppImages.school_4),

  ];

  GameRepository.createEmpty() {
    questions = [];
  }
}
