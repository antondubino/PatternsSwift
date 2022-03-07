//
//  Safe.swift
//  Patterns
//
//  Created by Антон Дубино on 24.02.2022.
//

import Foundation

class Safe {
    
    static let shared = Safe()
    var money = 20000
    
    // чтобы запретить создание экземпляров класса Safe (let safe = Safe()):
    private init() {}
}
