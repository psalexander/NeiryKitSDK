//
//  MainViewController.swift
//  NeiryApp
//
//  Created by Александр on 07.11.2024.
//

import UIKit
import NeiryKit

final class MainViewController: UIViewController {

    static func instance() -> MainViewController {
        let vc: MainViewController = MainViewController.storyboardInstance()
        return vc
    }

    private var presenter = MainPresenter()
    
    @IBOutlet weak var deviceBackgroundView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var decriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        deviceBackgroundView.isHidden = true
        
        presenter.delegate = self
        presenter.viewDidLoad()
    }

    @IBAction func devicesButtonAction(_ sender: Any) {
        let vc = DevicesViewController.instance()
        present(vc, animated: true)
    }

    @IBAction func disconnectButtonAction(_ sender: Any) {
        presenter.disconnect()
    }
}

extension MainViewController: MainPresenterDelegate {
    func showDevice(device: NeiryDevice) {
        deviceBackgroundView.isHidden = false
        nameLabel.text = device.deviceName
        idLabel.text = device.deviceID
        decriptionLabel.text = device.deviceDescription
    }

    func hideDevice() {
        deviceBackgroundView.isHidden = true
        nameLabel.text = nil
        idLabel.text = nil
        decriptionLabel.text = nil
    }
}
