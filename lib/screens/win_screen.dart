import 'package:find_word/blocs/game/game_bloc.dart';
import 'package:find_word/screens/result_screen.dart';
import 'package:find_word/utils/images/app_images.dart';
import 'package:find_word/utils/size/size_utils.dart';
import 'package:find_word/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<GameBloc, GameState>(builder: (context, state) {
        return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backgroundWin), fit: BoxFit.cover)),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("LEVEL COMPLETE",
                style: AppTextStyle.interBold.copyWith(color: Colors.white,fontSize: 30),
              ),
              20.getH(),
              Text("True Anwer is", style: AppTextStyle.interBlack,),
              30.getH(),
              Text(
                state.allQuestions[state.currentQuestionIndex-1].answer.toUpperCase(),
                style: AppTextStyle.interBlack.copyWith(color: Colors.yellow, fontSize: 45),
              ),
              30.getH(),
              Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.green.shade800, borderRadius: BorderRadius.circular(10)),
                  child: Text("YOUR SCORE: ${state.trueCount*100}",style: AppTextStyle.interBold.copyWith(color: Colors.white),)),
              80.getH(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade900),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Continue"))
            ],
          ),
        ),
      );
    }));
  }
}
