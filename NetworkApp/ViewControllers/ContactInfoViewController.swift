//
//  ContactInfoViewController.swift
//  NetworkApp
//
//  Created by Тадевос Курдоглян on 27.01.2025.
//

import UIKit

final class ContactInfoViewController: UIViewController {
    
    @IBOutlet var contactInfoLabel: UILabel!
    
    var contact: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        let contactText = """
        Email: \(contact.email)
        Phone: \(contact.phone)
        Birthdate: \(contact.birthday)
        Adress: \(contact.address.city), \(contact.address.street), \(contact.address.zipcode)
        """
        
        contactInfoLabel.text = contactText
    }
}
