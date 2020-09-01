import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learningflutterexamples/examples/audio/service.dart';

//Audio task where the audio works
class AudioPlayerTask extends BackgroundAudioTask {
  final _audioPlayer = AudioPlayer();

  //Start service
  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    // Broadcast that we're connecting, and what controls are available.
    await AudioServiceBackground.setState(
        controls: [pauseControl, stopControl],
        playing: true,
        processingState: AudioProcessingState.connecting);

    // Connect to the URL
    await _audioPlayer.setUrl(
        'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3');

    // Now we're ready to play
    await _audioPlayer.play();

    //Set media item info
    var mediaItem = MediaItem(
      id: '1',
      album: 'Station',
      title: '95.9 C',
      artUri:
          'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg',
    );

    //Send the media item to background
    await AudioServiceBackground.setMediaItem(mediaItem);

    // Broadcast that we're playing, and what controls are available.
    await AudioServiceBackground.setState(
        controls: [pauseControl, stopControl],
        playing: true,
        processingState: AudioProcessingState.ready);
  }

  //click from external devices (ideally should be check which button is)
  @override
  Future<void> onClick(MediaButton button) async {
    //If the audio is playing, pause it and send the new state
    if (_audioPlayer.playbackState == AudioPlaybackState.playing) {
      await _audioPlayer.pause();

      await AudioServiceBackground.setState(
          controls: [playControl, stopControl],
          playing: false,
          processingState: AudioProcessingState.ready);
    }
    //If the audio is on pause, play it and send the new state
    else if (_audioPlayer.playbackState == AudioPlaybackState.paused) {
      await AudioServiceBackground.setState(
          controls: [pauseControl, stopControl],
          playing: true,
          processingState: AudioProcessingState.ready);
      await _audioPlayer.play();
    }
  }

  @override
  void onSkipToPrevious() {
    print('Press previous key');
  }

  @override
  void onSkipToNext() {
    print('Press next key');
  }

  //ideally it is necessary to check the interruption type
  @override
  void onAudioFocusLost(AudioInterruption interruption) {
    print('Focus lost');
  }

  //ideally it is necessary to check the interruption type
  @override
  void onAudioFocusGained(AudioInterruption interruption) {
    print('Focus gained');
  }

  @override
  Future<void> onStop() async {
    // Stop playing audio
    await _audioPlayer.stop();
    //dispose the audio player
    await _audioPlayer.dispose();

    // Broadcast that we've stopped.
    await AudioServiceBackground.setState(
        controls: [],
        playing: false,
        processingState: AudioProcessingState.stopped);

    // Shut down this background task
    await super.onStop();
  }

  //Set play the service
  @override
  void onPlay() {
    AudioServiceBackground.setState(
        controls: [pauseControl, stopControl],
        playing: true,
        processingState: AudioProcessingState.ready);

    _audioPlayer.play();
  }

  //pause the service
  @override
  void onPause() {
    // Broadcast that we're paused, and what controls are available.
    AudioServiceBackground.setState(
        controls: [playControl, stopControl],
        playing: false,
        processingState: AudioProcessingState.ready);

    _audioPlayer.pause();
  }
}
