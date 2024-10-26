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
    }
    
    private func setupUI() {
        addSubview(nameLabel)
        addSubview(contactLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            contactLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contactLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contactLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            contactLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            contactLabel.heightAnchor.constraint(equalToConstant: 70),
            contactLabel.widthAnchor.constraint(equalToConstant: 70),
            
            nameLabel.leadingAnchor.constraint(equalTo: contactLabel.trailingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
