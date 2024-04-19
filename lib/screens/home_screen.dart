import 'package:find_word/blocs/game/game_bloc.dart';
import 'package:find_word/screens/game_screen.dart';
import 'package:find_word/utils/colors/app_colors.dart';
import 'package:find_word/utils/images/app_images.dart';
import 'package:find_word/utils/size/size_utils.dart';
import 'package:find_word/utils/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body:
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.background2),
                fit: BoxFit.cover)),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            50.getH(),
            Text("4 PICS 1 WORD", style: AppTextStyle.interBold.copyWith(color: Colors.white,fontSize: 40),),
            50.getH(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  ...List.generate(
                    1,
                        (index) => [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 6, color: Colors.white),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppImages.milk_1,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 6, color: Colors.white),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppImages.milk_2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 6, color: Colors.white),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppImages.milk_3,

                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 6, color: Colors.white),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppImages.milk_4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ).expand((images) => images).toList(),
                ],
              ),
            ),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.green.shade700, padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10)),onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GameScreen()));
            }, child: Text("PLAY", style: AppTextStyle.interBold.copyWith(color: Colors.white, fontSize: 34),)),


            55.getH(),
          ],
        ),
      ),
    );
  }
}
