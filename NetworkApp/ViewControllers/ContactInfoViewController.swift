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
        
        contactInfoLabel.text = contact.description
    }
}
