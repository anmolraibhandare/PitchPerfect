# PitchPerfect
Udacity iOS Nanodegree Project

#### Summary 
This application was created specifically for Udacity's iOS Developer Nanodegree. This project firmed up my knowledge on creating an application that implements AVFoundation, allowing user to record messages in different effects.

PitchPerfect is a simple AVFoundation iPhone app that allows users to record an audio using their microphone and then modulate the recorded audio to sound like a Chipmunk or Darth Vader. The user can also speed up or slow down the rate of playback, and experience fun echo and reverb effects.

Project Rubrics can be found [here](https://review.udacity.com/#!/rubrics/19/view).

#### Requirements
- Xcode 11.4
- Swift 5

#### Technologies Used In Application:
- AVFoundation
- Stack Views
- Auto Layout
- UIKit
- Swift

#### Implementation
- PitchPerfect demonstrates an example of MVC (Model-View-Controller) design principles.
- The App navigates between two scenes in the app using `UINavigationController`
- The app successfully uses `AVAudioRecorder` to record audio.
- The app uses the delegate pattern and implements the `audioRecorderDidFinishRecording()` method.
- The app does not use a Storyboard segue hardcoded to the `Stop` button. A segue from the first scene to the second is programmatically triggered via `performSegueWithIdentifier()`.
- Plays audio files using `AVFoundation`’s `AVAudioEngine` class

#### Screenshots
<img src="https://raw.githubusercontent.com/anmolraibhandare/PitchPerfect/master/AppScreenshots/Launchscreen.png" width="210 " height="450"> <img src="https://raw.githubusercontent.com/anmolraibhandare/PitchPerfect/master/AppScreenshots/HomeScreen.png" width="210 " height="450"> <img src="https://raw.githubusercontent.com/anmolraibhandare/PitchPerfect/master/AppScreenshots/Playbackscreen.png" width="210 " height="450">
