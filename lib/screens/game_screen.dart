import 'package:find_word/blocs/game/game_bloc.dart';
import 'package:find_word/utils/colors/app_colors.dart';
import 'package:find_word/utils/images/app_images.dart';
import 'package:find_word/utils/size/size_utils.dart';
import 'package:find_word/utils/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    context.read<GameBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.background),
                    fit: BoxFit.cover)),
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                50.getH(),
                Expanded(
                  flex: 6,
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      ...List.generate(
                        1,
                            (index) => [
                          if (state.currentQuestionIndex < state.allQuestions.length)
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 6, color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  state.allQuestions[state.currentQuestionIndex]
                                      .imageUrlFirst,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (state.currentQuestionIndex < state.allQuestions.length)
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 6, color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  state.allQuestions[state.currentQuestionIndex]
                                      .imageUrlSecond,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (state.currentQuestionIndex < state.allQuestions.length)
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 6, color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  state.allQuestions[state.currentQuestionIndex]
                                      .imageUrlThird,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (state.currentQuestionIndex < state.allQuestions.length)
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 6, color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  state.allQuestions[state.currentQuestionIndex]
                                      .imageUrlFourth,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ],
                      ).expand((images) => images).toList(),
                    ],
                  ),
                ),


                15.getH(),
                Center(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: state.allQuestions.isNotEmpty? state.allQuestions[state.currentQuestionIndex].answer.length : 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      final letter = index < state.enteredAnswer.length?state.enteredAnswer[index]:null;
                      return GestureDetector(
                        onTap: () {
                          context.read<GameBloc>().add(ClearSelectedLetterEvent(index));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 5),
                          ),
                          child: Center(
                            child: Text(
                              letter ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                    child:
                    GridView.count(
                      crossAxisCount: 6,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(
                        state.lettersList.length,
                            (index) {
                          final letter = state.lettersList[index];
                          final isLetterSelected = state.enteredAnswer.contains(letter);
                          return GestureDetector(
                            onTap: () {
                              context.read<GameBloc>().add(
                                CollectEnteredLetter(letter),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isLetterSelected ? Colors.grey : Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  letter.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.interBold.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GameBloc>().add(NextQuestions(context));
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
