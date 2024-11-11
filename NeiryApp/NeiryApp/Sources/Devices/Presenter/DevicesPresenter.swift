//
//  DevicesPresenter.swift
//  NeiryApp
//
//  Created by Александр on 25.10.2024.
//

import UIKit
import NeiryKit

protocol DevicesPresenterDelegate: AnyObject {
    func updateUI()
}

final class DevicesPresenter: NSObject {
    weak var delegate: DevicesPresenterDelegate?

    var model = DevicesModel()

    func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDevicesList), name: .NEED_UPDATE_DEVICES_NOTIFICATION, object: nil)
    }

    func didSelectRowAt(row: Int) {
        if let item = model.item(for: row) {
            NeiryManager.shared.connectTo(device: item)
        }
    }

    func requestDevices() {
        NeiryManager.shared.requestDevices()
    }

    @objc func onDevicesList(notification: Notification) {
        if let obj = notification.object as? [NeiryDevice] {
            model.list = obj

            DispatchQueue.main.async {
                self.delegate?.updateUI()
            }
        } else {
            DispatchQueue.main.async {
                self.delegate?.updateUI()
            }
        }
    }

    func count() -> Int {
        return model.count()
    }

    func item(for index: Int) -> NeiryDevice? {
        return model.item(for: index)
    }
}
