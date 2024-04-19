import 'package:find_word/blocs/game/game_bloc.dart';
import 'package:find_word/screens/game_screen.dart';
import 'package:find_word/screens/home_screen.dart';
import 'package:find_word/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GameBloc()..add(LoadQuestions()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: const HomeScreen(),
      ),
    );
  }
}
