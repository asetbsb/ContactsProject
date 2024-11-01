//
//  ViewController.swift
//  ContactsProject
//
//  Created by Asset on 10/22/24.
//

import UIKit

final class RootViewController: UIViewController {
    private var contactBrain = ContactBrain()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.backgroundColor = .systemBackground
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.identifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.layer.cornerRadius = 35
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
            
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        view.addSubview(addButton)
        view.bringSubviewToFront(addButton)
        setTableViewDelegates()
        setConstraints()
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            addButton.heightAnchor.constraint(equalToConstant: 70),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor),
            addButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30
            ),
            addButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30
            ),
        ])
    }
    
    @objc private func addButtonTapped() {
        let modalVC = ContactPageVC()
        modalVC.isNewContact = true
        modalVC.delegate = self
        present(modalVC, animated: true, completion: nil)
    }

}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactBrain.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier) as? ContactCell
        else {
            return UITableViewCell()
        }
        
        cell.set(contactBrain.contacts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let modalVC = ContactPageVC()
        modalVC.index = indexPath.row
        modalVC.contact = contactBrain.contacts[indexPath.row]
        modalVC.isNewContact = false
        modalVC.delegate = self
        present(modalVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) {_, _, completion in
            self.contactBrain.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
}

extension RootViewController: ChangeAvatarColorDelegate {
    func addNewContact(name: String, color: UIColor, number: Int?) {
        contactBrain.contacts.append(
            Contact(name: name, color: color, phoneNumber: number ?? 0)
        )
        tableView.reloadData()
    }
    
    func changeButtonTapped(index: Int, color: UIColor) {
        contactBrain.contacts[index].color = color
        tableView.reloadData()
    }
    
    func viewDismissed(index: Int, name: String, number: Int?) {
        contactBrain.contacts[index].name = name
        contactBrain.contacts[index].phoneNumber = number ?? 87777777777
        tableView.reloadData()
    }
}
