//
//  ViewController.swift
//  NeiryApp
//
//  Created by Александр on 17.10.2024.
//

import UIKit
import NeiryKit

class ViewController: UIViewController {

    let neiry = Neiry()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        DispatchQueue.global().async {
            self.neiry.delegate = self
            self.neiry.create(address: .inprocess, name: "Test sdk", type: TYPE_HEADBAND)
            self.neiry.requestDevices()
            print(Neiry.getClientVersion())
        }
        
        
        
    }


}

extension ViewController: NeiryDelegate {
    func onLog(message: String) {
        print(message)
    }
    
    func onError(message: String) {
        print(message)
    }
    
    func onConnected(device: NeiryDevice, channels: [NeiryChannel]) {
        print(device)
    }
    
    func onDisconnected() {
        print("onDisconnected")
    }
    
    func onDevices(devices: [NeiryDevice]) {
        print(devices)
    }
    
    func onMEMSData(samples: [NeiryMEMSData]) {
        
    }
    
    func onEEGData(samples: [NeiryEEGData]) {
        
    }
    
    func onPPGData(samples: [NeiryPPGData]) {
        
    }
    
    func onBattery(_ level: Int32) {
        
    }
}
