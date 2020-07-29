import 'package:audio_service/audio_service.dart';
import 'package:learningflutterexamples/examples/audio/audio_player_task.dart';

//Media Control for each button case
final playControl = MediaControl(
  androidIcon: 'drawable/ic_action_play_arrow',
  label: 'Play',
  action: MediaAction.play,
);
final pauseControl = MediaControl(
  androidIcon: 'drawable/ic_action_pause',
  label: 'Pause',
  action: MediaAction.pause,
);
final stopControl = MediaControl(
  androidIcon: 'drawable/ic_action_stop',
  label: 'Stop',
  action: MediaAction.stop,
);

//Entry Point for the service running and audio player task
backgroundTaskEntryPoint() {
  AudioServiceBackground.run(() {
    return AudioPlayerTask();
  });
}
