//
//  AlarmCVC.swift
//  LiveActivityPoc
//
//  Created by Ritik Sharma on 24/06/23.
//

import UIKit

class AlarmCVC: UICollectionViewCell {

    @IBOutlet weak var mainView: UIStackView!
    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var alarmName: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    public static let reuseIdentifier: String = "AlarmCVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    private func initialSetup() {
        self.alarmSwitch.isOn = false
        self.alarmName.text = ""
        self.alarmTime.text = ""
        self.alarmSwitch.onTintColor = UIColor.purple
        self.setupFont()
    }
    
    private func setupFont() {
        self.alarmName.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        self.alarmTime.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
    }
    
    func configure(with model: HomeCVList?) {
        self.alarmTime.text = model?.title
        self.alarmName.text = model?.subTitle
        self.configureStyle(style: model?.style)
    }

    private func configureStyle(style: Style?) {
        self.alarmTime.textColor = UIColor(hex: style?.titleColor ?? "#000000")
        self.alarmName.textColor = UIColor(hex: style?.subTitleColor ?? "#000000")
        self.contentView.roundCorners(radius: style?.cornerRadius)
        self.contentView.addShadow(color: UIColor.black)
        self.contentView.layer.borderColor = UIColor.black.cgColor
    }
}
