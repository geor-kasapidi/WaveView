//
//  ViewController.swift
//  Example
//
//  Created by Георгий Касапиди on 03.09.16.
//  Copyright © 2016 N7. All rights reserved.
//

import UIKit
import WaveView

class ViewController: UIViewController {

    @IBOutlet weak var waveView: N7WaveView! {
        didSet {
            waveView.idleAmplitude = 0.1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSRunLoop.mainRunLoop().addTimer(NSTimer(timeInterval: 0.5, target: self, selector: #selector(generateAmplitude), userInfo: nil, repeats: true), forMode: NSDefaultRunLoopMode)
    }
    
    @objc func generateAmplitude() {
        waveView.amplitude = CGFloat(drand48())
    }
}
