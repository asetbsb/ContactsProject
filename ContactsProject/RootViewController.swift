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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
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
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let modalVC = ContactPageVC()
        modalVC.index = indexPath.row
        modalVC.delegate = self
        modalVC.modalPresentationStyle = .pageSheet
        present(modalVC, animated: true, completion: nil)
    }
}

extension RootViewController: ChangeAvatarColorDelegate {
    func changeButtonTapped(index: Int, color: UIColor) {
        contactBrain.contacts[index].color = color
        tableView.reloadData()
    }
    
    
}
