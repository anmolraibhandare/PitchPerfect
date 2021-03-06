//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Anmol Raibhandare on 4/28/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    // MARK: Outlets and Properties
    
    var audioRecorder: AVAudioRecorder!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    // MARK: Record button is tapped
    
    @IBAction func recordAudio(_ sender: Any) {
        enableDisableButtons(state: true)
//        recordingLabel.text = "Recording in progress"
//        stopRecordingButton.isEnabled = true
//        recordButton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    // MARK: Stop Recording button is tapped

    @IBAction func stopRecording(_ sender: Any) {
        enableDisableButtons(state: false)
//        stopRecordingButton.isEnabled = false
//        recordButton.isEnabled = true
//        recordingLabel.text = "Tap to Record"
    
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    // MARK: AVAudioRecorder Delegate
    // Performs segue once recording is successfull
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else{
            print("Recording was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording"{
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    // MARK: Enable/Disable Buttons
    
    func enableDisableButtons(state:Bool) {
        if (state == false){
            stopRecordingButton.isEnabled = state
            recordButton.isEnabled = true
            recordingLabel.text = "Tap to Record"
        }
        if (state == true){
            stopRecordingButton.isEnabled = state
            recordButton.isEnabled = false
            recordingLabel.text = "Recording in progress"
        }
    }

}

