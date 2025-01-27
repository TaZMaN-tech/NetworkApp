//
//  ContactsViewController.swift
//  NetworkApp
//
//  Created by Тадевос Курдоглян on 25.01.2025.
//

import UIKit

final class ContactsViewController: UITableViewController {
    
    var contacts: [Person] = []
    
    private let url = URL(string: "https://fakerapi.it/api/v2/persons?_quantity=15&_gender=female&_birthday_start=2005-01-01")!
    private let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailVC = segue.destination as? ContactInfoViewController
        let contact = contacts[indexPath.row]
        detailVC?.title = contact.fullname
        detailVC?.contact = contacts[indexPath.row]
    }
    
    func fetchCell() {
        networkManager.fetch(Response.self, from: url) { [weak self] result in
            switch result {
            case .success(let contacts):
                self?.contacts = contacts.data
                self?.tableView.reloadData()
            case .failure(let error):
                print("Failed to fetch contacts: \(error)")
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = contacts[indexPath.row]
        
        
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullname
        
        cell.contentConfiguration = content
        return cell
    }
}
