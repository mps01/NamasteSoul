import 'package:antara/serene%20model/sound.dart';
import 'package:meta/meta.dart';

class PlayingData {
  bool isPlaying;
  bool isRandom;
  List<Sound> playing;

  PlayingData({
    @required this.isPlaying,
    @required this.isRandom,
    @required this.playing,
  });
}
