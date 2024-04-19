import 'package:find_word/data/repositories/game_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setUpDI() {
  locator.registerSingleton<GameRepository>(GameRepository());
}
