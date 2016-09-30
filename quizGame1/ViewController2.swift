//
//  ViewController2.swift
//  quizGame1
//
//  Created by student1 on 10/15/15.
//  Copyright © 2015 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController2: UIViewController {
    
    var ButtonAudioPlayer = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Finding the Balance", ofType: "mp3")!))

    var BackgroundAudio = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Finding the Balance", ofType: "mp3")!))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        BackgroundAudio!.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
