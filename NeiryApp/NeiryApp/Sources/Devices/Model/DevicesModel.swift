//
//  DeviceModel.swift
//  NeiryApp
//
//  Created by Александр on 25.10.2024.
//

import UIKit
import NeiryKit

final class DevicesModel: NSObject {
    var list:[NeiryDevice] = []

    func count() -> Int {
        return list.count
    }

    func item(for index: Int) -> NeiryDevice? {
        return list[safe: index]
    }
}
