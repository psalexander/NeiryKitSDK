//
//  MainPresenter.swift
//  NeiryApp
//
//  Created by Александр on 07.11.2024.
//

import UIKit
import NeiryKit

protocol MainPresenterDelegate: AnyObject {
    func showDevice(device: NeiryDevice)
    func hideDevice()
}

final class MainPresenter: NSObject {

    weak var delegate: MainPresenterDelegate?
    private var model: MainModel = .init()

    func viewDidLoad() {
        NeiryManager.shared.create()
        NeiryManager.shared.delegate = self
    }

    func updateUI() {
        
    }

    func disconnect() {
        NeiryManager.shared.disconnect()
    }
}

extension MainPresenter: NeiryDelegate {
    func onLog(message: String) {
        print("Log: \(message)")
    }

    func onError(message: String) {
        print("Error: \(message)")
    }

    func onConnected(device: NeiryDevice, channels: [NeiryChannel]) {
        model.device = device
        model.channels = channels

        DispatchQueue.main.async {
            self.updateUI()
            self.delegate?.showDevice(device: device)
        }

        print("Connected: \(device.deviceName)")

        print("device name : \(device.deviceName)")
        print("device id : \(device.deviceID)")
        print("device index : \(device.index)")

        for channel in channels {
            print("-----------------")
            print("channel index: \(channel.index)")
            print("channel name : \(channel.name)")
        }
    }
    
    func onDisconnected() {
        print("On Disconnected")

        DispatchQueue.main.async {
            self.updateUI()
            self.delegate?.hideDevice()
        }
    }
    
    func onDevices(devices: [NeiryDevice]) {
        print("Devices: \(devices)")
    }
    
    func onMEMSData(samples: [NeiryMEMSData]) {
        print("onMEMSData:")
        for sample in samples {
            print("time \(sample.timepoint) x: \(sample.x) y: \(sample.x) z: \(sample.x)")
        }
    }
    
    func onEEGData(samples: [NeiryEEGData]) {
        print("onEEGData:")
        for sample in samples {
            print("time \(sample.timepoint) data: \(sample.data)")
        }
    }
    
    func onPPGData(samples: [NeiryPPGData]) {
        print("onPPGData:")
        for sample in samples {
            print("time \(sample.timepoint) data: \(sample.value)")
        }
    }
    
    func onBattery(_ level: Int32) {
        print("Battery level: \(level)")
    }
}
