import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:learningflutterexamples/examples/audio/service.dart';

//Audio Screen
class AudioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Service Example'),
      ),
      body: Center(
        //Stream builder according different states of the playback
        child: StreamBuilder<PlaybackState>(
          stream: AudioService.playbackStateStream,
          builder: (context, snapshot) {
            //If it is null, set the stopped state
            final processingState =
                snapshot.data?.processingState ?? AudioProcessingState.stopped;
            //Indicate if the audio is playing or not
            final playing = snapshot.data?.playing ?? false;

            print(processingState);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Show the start button is the process hasn't been started or
                //it was stopped
                if (processingState == AudioProcessingState.none ||
                    processingState == AudioProcessingState.stopped)
                  RaisedButton(child: Text('Start'), onPressed: start),

                //Show the stop button if the process is already started
                if (processingState != AudioProcessingState.none &&
                    processingState != AudioProcessingState.stopped)
                  RaisedButton(child: Text('Stop'), onPressed: stop),

                //Show the pause button is the audio process is ready and it is
                // currently playing
                if (processingState == AudioProcessingState.ready && playing)
                  RaisedButton(child: Text('Pause'), onPressed: pause),
                //Show the play button is the audio process is ready and it is
                //currently on pause
                if (processingState == AudioProcessingState.ready && !playing)
                  RaisedButton(child: Text('Play'), onPressed: play),
              ],
            );
          },
        ),
      ),
    );
  }

  //Starting audio service with custom info
  void start() => AudioService.start(
        backgroundTaskEntrypoint: backgroundTaskEntryPoint,
        androidNotificationChannelName: 'Audio Service',
        androidNotificationColor: Colors.red.value,
      );

  //Stop the audio service
  void stop() => AudioService.stop();

  //pause the audio service
  void pause() => AudioService.pause();

  //play the audio service
  void play() => AudioService.play();
}
