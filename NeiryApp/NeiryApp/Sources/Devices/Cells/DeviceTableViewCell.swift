//
//  DeviceTableViewCell.swift
//  NeiryApp
//
//  Created by Александр on 07.11.2024.
//

import UIKit

final class DeviceTableViewCell: UITableViewCell {

    static let identifier = "DeviceTableViewCell"

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var firmwareLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
