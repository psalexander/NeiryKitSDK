//
//  NeiryManager.swift
//  NeiryApp
//
//  Created by Александр on 07.11.2024.
//

import UIKit
import NeiryKit

final class NeiryManager: NSObject {

    static let shared = NeiryManager()

    private let neiry = Neiry()

    weak var delegate: NeiryDelegate?
    
    func create() {
        neiry.delegate = self
        neiry.create(address: .inprocess, name: "Test sdk", type: TYPE_HEADBAND)
    }

    func connectTo(device: NeiryDevice) {
        neiry.connect(to: device)
    }
    
    func disconnect() {
        neiry.disconnect()
        // после отключения CapsuleClient требуется заново создать
        neiry.delegate = self
        neiry.create(address: .inprocess, name: "Test sdk", type: TYPE_HEADBAND)
    }

    func requestDevices() {
        neiry.requestDevices()
    }
}

extension NeiryManager: NeiryDelegate {
    func onLog(message: String) {
        delegate?.onLog(message: message)
    }
    
    func onError(message: String) {
        delegate?.onError(message: message)
    }

    func onConnected(device: NeiryDevice, channels: [NeiryChannel]) {
        NotificationCenter.default.post(Notification(name: .NEED_UPDATE_DEVICE_NOTIFICATION))
        delegate?.onConnected(device: device, channels: channels)
    }
    
    func onDisconnected() {
        delegate?.onDisconnected()
    }

    func onDevices(devices: [NeiryDevice]) {
        NotificationCenter.default.post(Notification(name: .NEED_UPDATE_DEVICES_NOTIFICATION, object: devices))
        delegate?.onDevices(devices: devices)
    }

    func onMEMSData(samples: [NeiryMEMSData]) {
        print("onMEMSData")
        delegate?.onMEMSData(samples: samples)
    }
    
    func onEEGData(samples: [NeiryEEGData]) {
        print("onEEGData")
        delegate?.onEEGData(samples: samples)
    }
    
    func onPPGData(samples: [NeiryPPGData]) {
        print("onPPGData")
        delegate?.onPPGData(samples: samples)
    }
    
    func onBattery(_ level: Int32) {
        delegate?.onBattery(level)
    }
}
