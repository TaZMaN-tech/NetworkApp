//
//  ViewController.swift
//  NetworkApp
//
//  Created by Тадевос Курдоглян on 18.01.2025.
//

import UIKit

final class ViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as? UINavigationController
        let contactsVC = navigationController?.topViewController as? ContactsViewController
        
        contactsVC?.fetchCell()
        
    }
}
