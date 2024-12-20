//
//  TableViewCell.swift
//  ContactsProject
//
//  Created by Asset on 10/22/24.
//

import UIKit

class ContactCell: UITableViewCell {
    
    static var identifier = "TableViewCellIdentifier"
    
    private lazy var contactLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.layer.cornerRadius = 35
        label.clipsToBounds = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var phoneNumber: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 10, weight: .thin)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ contact: Contact) {
        nameLabel.text = contact.name
        contactLabel.backgroundColor = contact.color
        contactLabel.text = String(contact.name.prefix(1))
        phoneNumber.text = String(contact.phoneNumber)
    }
    
    private func setupUI() {
        addSubview(nameLabel)
        addSubview(contactLabel)
        addSubview(phoneNumber)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            contactLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            contactLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            contactLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            contactLabel.heightAnchor.constraint(equalToConstant: 70),
            contactLabel.widthAnchor.constraint(equalToConstant: 70),
            
            nameLabel.leadingAnchor.constraint(equalTo: contactLabel.trailingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            
            phoneNumber.leadingAnchor.constraint(equalTo: contactLabel.trailingAnchor, constant: 25),
            phoneNumber.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            phoneNumber.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            phoneNumber.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -12
            ),
        ])
    }
}
