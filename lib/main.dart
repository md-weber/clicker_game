import 'package:clickergame/clicker-game.dart';
import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ClickerGame game = ClickerGame();
  runApp(game.widget);

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setPortraitUpOnly();

  Flame.images.loadAll([
    "shovel.jpg",
  ]);
}
