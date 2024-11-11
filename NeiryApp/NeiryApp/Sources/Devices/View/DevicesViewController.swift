//
//  DevicesViewController.swift
//  NeiryApp
//
//  Created by Александр on 25.10.2024.
//

import UIKit
import NeiryKit

final class DevicesViewController: UIViewController {

    static func instance() -> DevicesViewController {
        let vc: DevicesViewController = DevicesViewController.storyboardInstance()
        return vc
    }

    private var presenter = DevicesPresenter()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: DeviceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DeviceTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

        presenter.delegate = self
        presenter.viewDidLoad()
    }

    @IBAction func deviceSearchAction(_ sender: Any) {
        presenter.requestDevices()
    }
}

extension DevicesViewController: DevicesPresenterDelegate {
    func updateUI() {
        tableView.reloadData()
    }
}

extension DevicesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DeviceTableViewCell.identifier, for: indexPath) as! DeviceTableViewCell
        if let item = presenter.item(for: indexPath.row) {
            cell.idLabel.text = item.deviceID
            cell.nameLabel.text = item.deviceName
            cell.modeLabel.text = String(item.deviceMode.rawValue)
            cell.descriptionLabel.text = item.deviceDescription
            cell.typeLabel.text = String(item.deviceType.rawValue)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}

extension DevicesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let actionSheet = UIAlertController(title: "Подключить", message: "Подключить устройство?", preferredStyle: .alert)
        actionSheet.addAction(UIAlertAction(title: "Подключить", style: .default, handler: { action in
            self.presenter.didSelectRowAt(row: indexPath.row)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.dismiss(animated: true)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)

    }
}
