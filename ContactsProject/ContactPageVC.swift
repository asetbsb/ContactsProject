//
//  ContactPageVC.swift
//  ContactsProject
//
//  Created by Asset on 10/24/24.
//

import UIKit

final class ContactPageVC: UIViewController {
    
    private let contactBrain = ContactBrain()
    weak var delegate: ChangeAvatarColorDelegate?
    var index = 0
    
    //MARK: - UI elements
        
    private lazy var avatarView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor(rgb: 0x54473F).cgColor
        view.layer.borderWidth = 4
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor(rgb: 0x54473F).cgColor
        view.layer.borderWidth = 4
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonsView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor(rgb: 0x54473F).cgColor
        view.layer.borderWidth = 4
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contactAvatar: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 70
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 48, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contactName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func createButton() -> UIButton {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = .red
        button.layer.cornerRadius = 35
        button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.backgroundColor = contactBrain.colors[
            Int(arc4random_uniform(UInt32(contactBrain.colors.count)))
        ]
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(rgb: 0xCBD2A4)
        addSubviews()
        setContactDesign()
        setViewConstraints()
        setElementsConstraints()
    }
    
    private func setContactDesign() {
        contactName.text = contactBrain.contacts[index].name
        contactAvatar.text = String(contactBrain.contacts[index].name.prefix(1))
        contactAvatar.backgroundColor = contactBrain.contacts[index].color
    }
    
    private func addSubviews() {
        view.addSubview(avatarView)
        view.addSubview(titleView)
        view.addSubview(buttonsView)
        
        avatarView.addSubview(contactAvatar)
        titleView.addSubview(contactName)
        
        buttonsView.addSubview(stackView)
        for _ in 1...4 {
            stackView.addArrangedSubview(createButton())
        }
        
        buttonsView.addSubview(stackView2)
        for _ in 1...4 {
            stackView2.addArrangedSubview(createButton())
        }
    }
    
    private func setViewConstraints() {
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            avatarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            avatarView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.4),
            
            titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleView.topAnchor.constraint(equalTo: avatarView.bottomAnchor),
            titleView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.2),
            
            buttonsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonsView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            buttonsView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.4),
            
            stackView.heightAnchor.constraint(equalTo: buttonsView.heightAnchor, multiplier: 0.5),
            stackView.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor),
            
            stackView2.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            stackView2.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor),
            stackView2.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor),
            stackView2.heightAnchor.constraint(equalTo: buttonsView.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func setElementsConstraints() {
        NSLayoutConstraint.activate([
            contactAvatar.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            contactAvatar.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
            contactAvatar.heightAnchor.constraint(equalToConstant: 140),
            contactAvatar.widthAnchor.constraint(equalToConstant: 140),
            
            contactName.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            contactName.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
        ])
    }
    
    @objc private func changeColor(_ sender: UIButton) {
        contactAvatar.backgroundColor = sender.backgroundColor
        delegate?.changeButtonTapped(index: index, color: sender.backgroundColor ?? .black)
    }

}
