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
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        fetchPersons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailVC = segue.destination as? ContactInfoViewController
        let contact = contacts[indexPath.row]
        detailVC?.title = contact.fullname
        detailVC?.contact = contacts[indexPath.row]
    }
    
    private func setupActivityIndicator() {
            activityIndicator.center = view.center
            activityIndicator.hidesWhenStopped = true
            view.addSubview(activityIndicator)
        }
    
    private func fetchPersons() {
        networkManager.fetchPersons(from: url) { [unowned self] result in
            switch result {
            case .success(let persons):
                contacts = persons.data
                tableView.reloadData()
            case .failure(let error):
                print(error)
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
