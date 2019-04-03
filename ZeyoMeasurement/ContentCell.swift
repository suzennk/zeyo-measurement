//
//  ContentCell.swift
//  ZeyoMeasurement
//
//  Created by Susan Kim on 03/04/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell, UITextFieldDelegate {
    
    let partLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NECK"
        return label
    }()
    
    let lengthTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "\(45.2)"
        return textField
    }()

    let unitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UNIT"
        return label
    }()
    
    var measurementItem: (Part, MeasurementAnchor)! {
        didSet {
            partLabel.text = measurementItem.0.label
            lengthTextField.text = "\(measurementItem.1.length)"
            unitLabel.text = ApplicationSettings.Status.defaultUnit.label
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setupContraints() {
        contentView.preservesSuperviewLayoutMargins = true
        
        let stackView = UIStackView(arrangedSubviews: [partLabel, lengthTextField, unitLabel])
        contentView.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        
        stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        print (contentView.safeAreaInsets.left)
        stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
