//
//  SingletonViewController.swift
//  Patterns
//
//  Created by Антон Дубино on 24.02.2022.
//

import UIKit

class SingletonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let safe = Safe.shared
        print(safe.money)
    }
    
}
